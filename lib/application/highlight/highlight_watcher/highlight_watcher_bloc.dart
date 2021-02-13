import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';

part 'highlight_watcher_event.dart';
part 'highlight_watcher_state.dart';
part 'highlight_watcher_bloc.freezed.dart';

/// Bloc to watch Highlights.
///
/// The event [_HighlighReceived] was created specifically to overcome a
/// potential problem regarding the yielding of state from a [Stream]. In
/// this case, by yielding states by listening to `watchAll()` Stream from
/// [IHighlightRepository]. If we yield states using the following approach:
///
/// ```
/// yield* _highlightRepository.watchAll().map(
///     (failureOrHighligths) => failureOrHighligths.fold(
///       (failure) => HighlightWatcherState.loadFailure(failure),
///       (highlights) => HighlightWatcherState.loadSuccess(highlights),
///     ),
///   );
/// ```
///
/// the bloc will never stop of yielding states, because the Stream in
/// [IHighlightRepository] will be always active, listening and pushing
/// new data as long as the user stands in the respective screen. Because
/// of this, we need an intermediate event to be able to handle properly
/// the Stream.
///
/// Similarly, we need also a [_streamSubscription] variable to store
/// temporarly the current Stream being listened. This way, we can easily
/// `cancel()` the subscription to one of them and switch to the other one,
/// dependending on the event triggered.
@injectable
class HighlightWatcherBloc
    extends Bloc<HighlightWatcherEvent, HighlightWatcherState> {
  final IHighlightRepository _highlightRepository;

  HighlightWatcherBloc(this._highlightRepository) : super(const _Initial());

  StreamSubscription<Either<HighlightFailure, KtList<Highlight>>>
      _streamSubscription;

  @override
  Stream<HighlightWatcherState> mapEventToState(
    HighlightWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (event) async* {
        yield const HighlightWatcherState.loadInProgress();
        await _streamSubscription?.cancel();
        _streamSubscription = _highlightRepository.watchAll().listen(
              (failureOrHighlights) => add(
                HighlightWatcherEvent.highlighReceived(
                  failureOrHighlights,
                ),
              ),
            );
      },
      watchFilteredStarted: (event) async* {
        yield const HighlightWatcherState.loadInProgress();
        await _streamSubscription?.cancel();
        _streamSubscription = _highlightRepository
            .watchFiltered(event.filter)
            .listen((failureOrHighlights) => add(
                  HighlightWatcherEvent.highlighReceived(failureOrHighlights),
                ));
      },
      highlighReceived: (event) async* {
        yield event.failureOrHighlights.fold(
          (failure) => HighlightWatcherState.loadFailure(failure),
          (highlights) => HighlightWatcherState.loadSuccess(highlights),
        );
      },
    );
  }

  /// Close subscription to Firestore Stream to prevent memory leaks.
  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
