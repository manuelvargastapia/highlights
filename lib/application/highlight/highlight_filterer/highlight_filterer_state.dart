part of 'highlight_filterer_bloc.dart';

@freezed
abstract class HighlightFiltererState with _$HighlightFiltererState {
  const factory HighlightFiltererState({
    @required HighlightSearchFilter filters,
  }) = _HighlightFiltererState;

  factory HighlightFiltererState.initial() => HighlightFiltererState(
        filters: HighlightSearchFilter.initial(),
      );
}
