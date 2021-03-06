import 'package:dartz/dartz.dart';
import 'package:highlights/domain/core/failures.dart';
import 'package:kt_dart/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/text_recognition/value_objects.dart';

part 'text_recognition_result.freezed.dart';

@freezed
abstract class TextRecognitionResult with _$TextRecognitionResult {
  const factory TextRecognitionResult({
    @required RecognizedText recognizedText,
    @required ImmutableList<RecognizedTextElement> recognizedElements,
    @required Option<ImageSize> imageSize,
  }) = _TextRecognitionResult;

  const TextRecognitionResult._();

  factory TextRecognitionResult.empty() => TextRecognitionResult(
        recognizedText: RecognizedText(''),
        recognizedElements: ImmutableList(const KtList.empty()),
        imageSize: none(),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return recognizedText.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
