import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_failure.freezed.dart';

@freezed
abstract class HighlightFailure with _$HighlightFailure {
  const factory HighlightFailure.unexpected() = _Unexpected;
  // const factory HighlightFailure.textNotRecognized() = _TextNotRecognized;
  // const factory HighlightFailure.errorReadingFile() = _ErrorReadingFile;
  // const factory HighlightFailure.errorLoadingImage() = _ErrorLoadingImage;
}
