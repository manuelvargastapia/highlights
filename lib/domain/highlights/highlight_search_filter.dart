import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_search_filter.freezed.dart';

@freezed
abstract class HighlightSearchFilter with _$HighlightSearchFilter {
  const factory HighlightSearchFilter({
    @required bool hasImage,
  }) = _HighlightSearchFilter;

  factory HighlightSearchFilter.initial() => const HighlightSearchFilter(
        hasImage: true,
      );
}
