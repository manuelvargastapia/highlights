part of 'highlight_form_bloc.dart';

@freezed
abstract class HighlightFormState with _$HighlightFormState {
  /// We need to differentiate between [isEditing] and [isSaving]
  /// because they represent different states in regards to Firebase
  /// methods in [HighlightRepository].
  const factory HighlightFormState({
    @required Highlight highlight,
    @required bool isEditing,
    @required bool isProcessingImage,
    @required bool isSaving,
    @required Option<Either<HighlightFailure, Unit>> saveFailureOrSuccessOption,
  }) = _HighlightFormState;

  factory HighlightFormState.initial() => HighlightFormState(
        highlight: Highlight.empty(),
        isEditing: false,
        isProcessingImage: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
