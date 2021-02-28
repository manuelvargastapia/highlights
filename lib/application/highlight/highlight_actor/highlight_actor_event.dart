part of 'highlight_actor_bloc.dart';

@freezed
abstract class HighlightActorEvent with _$HighlightActorEvent {
  const factory HighlightActorEvent.deleted(Highlight highlight) = _Deleted;
}
