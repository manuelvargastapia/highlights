part of 'highlight_filterer_bloc.dart';

@freezed
abstract class HighlightFiltererEvent with _$HighlightFiltererEvent {
  const factory HighlightFiltererEvent.showOnlyIfHasImageToggled() =
      _ShowOnlyIfHasImageToggled;
}
