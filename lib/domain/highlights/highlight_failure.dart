import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_failure.freezed.dart';

@freezed
abstract class HighlightFailure with _$HighlightFailure {
  const factory HighlightFailure.unexpected() = _Unexpected;

  /// Firebase secutiry rules doesn't allow user access a particular document.
  const factory HighlightFailure.insufficientPermission() =
      _InsufficientPermission;

  /// Firebase couldn't update/delete the document.
  const factory HighlightFailure.unableToUpdate() = _UnableToUpdate;
}
