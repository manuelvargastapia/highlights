import 'package:dartz/dartz.dart';
import 'package:highlights/domain/highlights/image.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/highlights/quote.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/i__text_recognition_repostitory.dart';

@LazySingleton(as: ITextRecognitionRepository)
class TextRecognitionRepository implements ITextRecognitionRepository {
  final FirebaseVision _firebaseVision;

  TextRecognitionRepository(this._firebaseVision);

  /// Use on-device model to extract text from the image.
  ///
  /// This method is intended to be called with an image, so it
  /// throws [NotImageProvided] otherwise.
  @override
  Future<Either<HighlightFailure, Quote>> processImage(
    Image image,
  ) async {
    try {
      final file = image.imageFile
          .getOrElse(() => throw NotImageProvided())
          .getOrCrash();
      final visionImage = FirebaseVisionImage.fromFile(file);
      final textRecognizer = _firebaseVision.textRecognizer();
      final visionText = await textRecognizer.processImage(visionImage);

      // TODO: use or remove
      // for (final block in visionText.blocks) {
      // final boundingBox = block.boundingBox;
      // final cornerPoints = block.cornerPoints;
      // final languages = block.recognizedLanguages;
      // final text = block.text;
      // for (final line in block.lines) {
      // Same getters as TextBlock
      // for (final element in line.elements) {
      // Same getters as TextBlock
      // }
      // }
      // }

      await textRecognizer.close();
      if (visionText.text.isEmpty) {
        return left(const HighlightFailure.noTextDetected());
      }
      return right(
        Quote(
          highlightQuote: HighlightQuote(visionText.text),
        ),
      );
    } catch (e) {
      return left(const HighlightFailure.unableToProcessImage());
    }
  }
}
