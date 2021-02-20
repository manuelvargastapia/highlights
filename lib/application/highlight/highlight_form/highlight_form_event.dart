part of 'highlight_form_bloc.dart';

@freezed
abstract class HighlightFormEvent with _$HighlightFormEvent {
  const factory HighlightFormEvent.initialized(
    Option<Highlight> initialHighlighOption,
  ) = _Initialized;
  const factory HighlightFormEvent.quoteChange(String quote) = _QuoteChange;
  const factory HighlightFormEvent.colorChange(Color color) = _ColorChange;
  const factory HighlightFormEvent.bookTitleChanged(
    String bookTitle,
  ) = _BookTitleChanged;
  const factory HighlightFormEvent.pageNumberChanged(
    int pageNumber,
  ) = _PageNumberChanged;
  const factory HighlightFormEvent.imageUrlChanged(
    String imageUrl,
  ) = _ImageUrlChanged;
  const factory HighlightFormEvent.saved() = _Saved;
}
