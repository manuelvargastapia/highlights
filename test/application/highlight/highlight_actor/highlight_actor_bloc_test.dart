import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';

class MockHighlightRepository extends Mock implements IHighlightRepository {}

void main() {
  MockHighlightRepository mockHighlightRepository;

  setUp(() {
    mockHighlightRepository = MockHighlightRepository();
  });

  group('_Deleted', () {
    blocTest<HighlightActorBloc, HighlightActorState>(
      '\nGiven existent Highlight'
      '\nWhen _Deleted ocurrs'
      '\nThen _DeleteSuccess is emitted',
      build: () {
        when(mockHighlightRepository.delete(any))
            .thenAnswer((_) async => right(unit));
        return HighlightActorBloc(mockHighlightRepository);
      },
      act: (bloc) {
        bloc.add(HighlightActorEvent.deleted(Highlight.empty()));
      },
      expect: [
        const HighlightActorState.actionInProgress(),
        const HighlightActorState.deleteSuccess(),
      ],
      verify: (_) {
        verify(mockHighlightRepository.delete(any)).called(1);
      },
    );

    blocTest<HighlightActorBloc, HighlightActorState>(
      '\nGiven existent Highlight'
      '\nWhen _Deleted ocurrs'
      '\nThen _DeleteFailure is emitted',
      build: () {
        when(mockHighlightRepository.delete(any))
            .thenAnswer((_) async => left(const HighlightFailure.unexpected()));
        return HighlightActorBloc(mockHighlightRepository);
      },
      act: (bloc) {
        bloc.add(HighlightActorEvent.deleted(Highlight.empty()));
      },
      expect: [
        const HighlightActorState.actionInProgress(),
        const HighlightActorState.deleteFailure(HighlightFailure.unexpected()),
      ],
      verify: (_) {
        verify(mockHighlightRepository.delete(any)).called(1);
      },
    );
  });
}
