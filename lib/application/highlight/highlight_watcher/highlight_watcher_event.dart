part of 'highlight_watcher_bloc.dart';

@freezed
abstract class HighlightWatcherEvent with _$HighlightWatcherEvent {
  const factory HighlightWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory HighlightWatcherEvent.watchFilteredStarted(
    HighlighSearchFilter filter,
  ) = _WatchFilteredStarted;
  const factory HighlightWatcherEvent.highlighReceived(
    Either<HighlightFailure, KtList<Highlight>> failureOrHighlights,
  ) = _HighlighReceived;
}
