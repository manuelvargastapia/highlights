import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';

class MockHighlightRepository extends Mock implements IHighlightRepository {}

void main() {
  MockHighlightRepository mockHighlightRepository;
  final highlight = Highlight.empty();

  setUp(() {
    mockHighlightRepository = MockHighlightRepository();
  });

  group('_WatchAllStarted', () {
    final highlight = Highlight.empty();
    blocTest<HighlightWatcherBloc, HighlightWatcherState>(
      '\nGiven successful Highlight watching'
      '\nWhen _WatchAllStarted ocurrs'
      '\nThen _LoadSuccess is emitted',
      build: () {
        when(mockHighlightRepository.watchAll()).thenAnswer(
          (_) => Stream.fromFuture(
            Future.delayed(
              const Duration(milliseconds: 500),
              () => right(KtList.from([highlight])),
            ),
          ),
        );
        return HighlightWatcherBloc(mockHighlightRepository);
      },
      act: (bloc) {
        bloc.add(const HighlightWatcherEvent.watchAllStarted());
      },
      wait: const Duration(milliseconds: 1000),
      expect: [
        const HighlightWatcherState.loadInProgress(),
        HighlightWatcherState.loadSuccess(KtList.from([highlight])),
      ],
      verify: (_) {
        verify(mockHighlightRepository.watchAll()).called(1);
      },
    );

    blocTest<HighlightWatcherBloc, HighlightWatcherState>(
      '\nGiven failed Highlight watching'
      '\nWhen _WatchAllStarted ocurrs'
      '\nThen _LoadFailure is emitted',
      build: () {
        when(mockHighlightRepository.watchAll()).thenAnswer(
          (_) => Stream.fromFuture(
            Future.delayed(
              const Duration(milliseconds: 500),
              () => left(const HighlightFailure.unexpected()),
            ),
          ),
        );
        return HighlightWatcherBloc(mockHighlightRepository);
      },
      act: (bloc) {
        bloc.add(const HighlightWatcherEvent.watchAllStarted());
      },
      wait: const Duration(milliseconds: 1000),
      expect: [
        const HighlightWatcherState.loadInProgress(),
        const HighlightWatcherState.loadFailure(HighlightFailure.unexpected()),
      ],
      verify: (_) {
        verify(mockHighlightRepository.watchAll()).called(1);
      },
    );
  });

  group('_WatchFilteredStarted', () {
    final filter = HighlightSearchFilter.initial();
    blocTest<HighlightWatcherBloc, HighlightWatcherState>(
      '\nGiven successful filtered Highlight watching'
      '\nWhen _WatchFilteredStarted ocurrs'
      '\nThen _LoadSuccess is emitted',
      build: () {
        when(mockHighlightRepository.watchFiltered(any)).thenAnswer(
          (_) => Stream.fromFuture(
            Future.delayed(
              const Duration(milliseconds: 500),
              () => right(KtList.from([highlight])),
            ),
          ),
        );
        return HighlightWatcherBloc(mockHighlightRepository);
      },
      act: (bloc) {
        bloc.add(HighlightWatcherEvent.watchFilteredStarted(filter));
      },
      wait: const Duration(milliseconds: 1000),
      expect: [
        const HighlightWatcherState.loadInProgress(),
        HighlightWatcherState.loadSuccess(KtList.from([highlight])),
      ],
      verify: (_) {
        verify(mockHighlightRepository.watchFiltered(filter)).called(1);
      },
    );

    blocTest<HighlightWatcherBloc, HighlightWatcherState>(
      '\nGiven failed filtered Highlight watching'
      '\nWhen _WatchAllStarted ocurrs'
      '\nThen _LoadFailure is emitted',
      build: () {
        when(mockHighlightRepository.watchFiltered(any)).thenAnswer(
          (_) => Stream.fromFuture(
            Future.delayed(
              const Duration(milliseconds: 500),
              () => left(const HighlightFailure.unexpected()),
            ),
          ),
        );
        return HighlightWatcherBloc(mockHighlightRepository);
      },
      act: (bloc) {
        bloc.add(HighlightWatcherEvent.watchFilteredStarted(filter));
      },
      wait: const Duration(milliseconds: 1000),
      expect: [
        const HighlightWatcherState.loadInProgress(),
        const HighlightWatcherState.loadFailure(HighlightFailure.unexpected()),
      ],
      verify: (_) {
        verify(mockHighlightRepository.watchFiltered(filter)).called(1);
      },
    );
  });

  group('_HighlighReceived', () {});

  blocTest<HighlightWatcherBloc, HighlightWatcherState>(
    '\nGiven successful Highlight received'
    '\nWhen _HighlighReceived ocurrs'
    '\nThen _LoadSuccess is emitted',
    build: () => HighlightWatcherBloc(mockHighlightRepository),
    act: (bloc) {
      bloc.add(
        HighlightWatcherEvent.highlighReceived(
          right(KtList.from([highlight])),
        ),
      );
    },
    expect: [
      HighlightWatcherState.loadSuccess(KtList.from([highlight])),
    ],
  );

  blocTest<HighlightWatcherBloc, HighlightWatcherState>(
    '\nGiven failed Highlight received'
    '\nWhen _HighlighReceived ocurrs'
    '\nThen _LoadFailure is emitted',
    build: () => HighlightWatcherBloc(mockHighlightRepository),
    act: (bloc) {
      bloc.add(
        HighlightWatcherEvent.highlighReceived(
          left(const HighlightFailure.unexpected()),
        ),
      );
    },
    expect: [
      const HighlightWatcherState.loadFailure(HighlightFailure.unexpected()),
    ],
  );
}
