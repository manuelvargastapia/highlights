import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/highlights/value_objects.dart';

part 'highlight_search_filter.freezed.dart';

/// Convenience class to make UI and Repository uses easier
@freezed
abstract class OrderByOption with _$OrderByOption {
  const factory OrderByOption.orderByBookTitle() = _OrderByBookTitle;
  const factory OrderByOption.orderByDate() = _OrderByDate;

  static List<OrderByOption> get asList => const [
        _OrderByBookTitle(),
        _OrderByDate(),
      ];
}

@freezed
abstract class HighlightSearchFilter with _$HighlightSearchFilter {
  const factory HighlightSearchFilter({
    @required bool showOnlyIfHasImage,
    @required Option<HighlightColor> colorMatchOption,
    @required OrderByOption orderByOption,
    @required bool descendingOrder,
  }) = _HighlightSearchFilter;

  factory HighlightSearchFilter.initial() => HighlightSearchFilter(
        showOnlyIfHasImage: false,
        colorMatchOption: none(),
        orderByOption: const OrderByOption.orderByDate(),
        descendingOrder: true,
      );
}
