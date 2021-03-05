import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_recognition_failure.freezed.dart';

/// Failure unit class similar to Domain layer failures.
@freezed
abstract class TextRecognitionFailure with _$TextRecognitionFailure {
  /// FirebaseVision couldn't process image
  const factory TextRecognitionFailure.unableToProcessImage() =
      _UnableToProcessImage;

  /// FirebaseVision couldn't find text
  const factory TextRecognitionFailure.noTextDetected() = _NoTextDetected;
}
