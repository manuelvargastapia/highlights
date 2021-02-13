import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/highlights/value_objects.dart';

part 'highlight_search_filter.freezed.dart';

@freezed
abstract class HighlighSearchFilter with _$HighlighSearchFilter {
  const factory HighlighSearchFilter.byBookTitle({
    @required BookTitleFilter bookTitle,
  }) = _ByBookTitle;
}
