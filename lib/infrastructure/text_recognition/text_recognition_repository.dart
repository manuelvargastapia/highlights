import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart' as mat;

import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/text_recognition/text_recognition_result.dart';
import 'package:highlights/domain/text_recognition/value_objects.dart';
import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/text_recognition/i_text_recognition_repository.dart';
import 'package:highlights/domain/text_recognition/text_recognition_failure.dart';

@LazySingleton(as: ITextRecognitionRepository)
class TextRecognitionRepository implements ITextRecognitionRepository {
  final FirebaseVision _firebaseVision;

  TextRecognitionRepository(this._firebaseVision);

  @override
  Future<Either<TextRecognitionFailure, TextRecognitionResult>>
      extratTextFromImage(Image image) async {
    try {
      final List<TextElement> _elements = [];
      final file = image.imageFile.getOrElse(() => throw NotImageProvided());
      final visionImage = FirebaseVisionImage.fromFile(file.getOrCrash());
      final textRecognizer = _firebaseVision.textRecognizer();
      final visionText = await textRecognizer.processImage(visionImage);

      for (final block in visionText.blocks) {
        for (final line in block.lines) {
          for (final element in line.elements) {
            _elements.add(element);
          }
        }
      }

      await textRecognizer.close();

      if (visionText.text.isEmpty) {
        return left(const TextRecognitionFailure.noTextDetected());
      }

      return right(
        TextRecognitionResult(
          recognizedText: RecognizedText(visionText.text),
          recognizedElements: ImmutableList(
            KtList.from(_elements.map((e) => RecognizedTextElement(e))),
          ),
          imageSize: none(),
        ),
      );
    } catch (e) {
      return left(const TextRecognitionFailure.unableToProcessImage());
    }
  }

  @override
  Future<Either<TextRecognitionFailure, ImageSize>> getImageSize(
    Image entityImage,
  ) async {
    try {
      final file = entityImage.imageFile
          .getOrElse(() => throw NotImageProvided())
          .getOrCrash();
      final image = mat.Image.file(file);
      final Completer<Size> completer = Completer<Size>();
      image.image.resolve(const mat.ImageConfiguration()).addListener(
        mat.ImageStreamListener((mat.ImageInfo info, bool _) {
          completer.complete(Size(
            info.image.width.toDouble(),
            info.image.height.toDouble(),
          ));
        }),
      );
      final size = await completer.future;
      return right(ImageSize(size));
    } catch (e) {
      return left(const TextRecognitionFailure.unableToProcessImage());
    }
  }
}
