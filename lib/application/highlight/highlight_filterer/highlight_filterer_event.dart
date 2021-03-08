part of 'highlight_filterer_bloc.dart';

@freezed
abstract class HighlightFiltererEvent with _$HighlightFiltererEvent {
  const factory HighlightFiltererEvent.showOnlyIfHasImageToggled() =
      _ShowOnlyIfHasImageToggled;
  const factory HighlightFiltererEvent.filterByColorMatch(
    Option<Color> colorOption,
  ) = _FilterByColorMatch;
  const factory HighlightFiltererEvent.orderByOptionChanged(
    OrderByOption option,
  ) = _OrderByOptionChanged;
  const factory HighlightFiltererEvent.descendingOrderToggled() =
      _DescendingOrderToggled;
}
