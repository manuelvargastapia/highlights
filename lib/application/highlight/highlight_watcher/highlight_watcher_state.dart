part of 'highlight_watcher_bloc.dart';

@freezed
abstract class HighlightWatcherState with _$HighlightWatcherState {
  const factory HighlightWatcherState.initial() = _Initial;
  const factory HighlightWatcherState.loadInProgress() = _LoadInProgress;
  const factory HighlightWatcherState.loadSuccess(
    KtList<Highlight> highlights,
  ) = _LoadSuccess;
  const factory HighlightWatcherState.loadFailure(
    HighlightFailure failure,
  ) = _LoadFailure;
}
