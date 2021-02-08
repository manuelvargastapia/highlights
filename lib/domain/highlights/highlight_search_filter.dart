import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_search_filter.freezed.dart';

@freezed
abstract class HighlighSearchFilter with _$HighlighSearchFilter {
  const factory HighlighSearchFilter.byBookTitle({
    @required String bookTitle,
  }) = _ByBookTitle;
}
