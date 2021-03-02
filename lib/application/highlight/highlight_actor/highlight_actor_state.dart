part of 'highlight_actor_bloc.dart';

@freezed
abstract class HighlightActorState with _$HighlightActorState {
  const factory HighlightActorState.initial() = _Initial;
  const factory HighlightActorState.actionInProgress() = _ActionInProgress;
  const factory HighlightActorState.deleteFailure(
    HighlightFailure failure,
  ) = _DeleteFailure;
  const factory HighlightActorState.deleteSuccess() = _DeleteSuccess;
}
