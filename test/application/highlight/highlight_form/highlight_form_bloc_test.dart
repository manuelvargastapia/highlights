import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

class MockIHighlightRepository extends Mock implements IHighlightRepository {}

void main() {
  MockIHighlightRepository mockIHighlightRepository;
  final initialState = HighlightFormState.initial();

  setUp(() {
    mockIHighlightRepository = MockIHighlightRepository();
  });

  group('_Initialized', () {
    final emptyHighlight = Highlight.empty();

    blocTest(
      '\nGiven _Initialized ocurrs'
      '\nWhen initial Highlight Option is some()'
      '\nThen emit state with Highlight and isEditing',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(HighlightFormEvent.initialized(some(emptyHighlight)));
      },
      expect: [
        initialState.copyWith(
          highlight: emptyHighlight,
          isEditing: true,
        ),
      ],
    );

    blocTest(
      '\nGiven _Initialized ocurrs'
      '\nWhen initial Highlight Option is none()'
      '\nThen emit initial state',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      seed: initialState,
      act: (bloc) {
        bloc.add(HighlightFormEvent.initialized(none()));
      },
      expect: [], // After event, bloc will emitt same seeded state, so there is no changes
    );
  });

  group('_QuoteChange', () {
    const newQuote = 'new quote';
    blocTest(
      '\nGiven any state'
      '\nWhen _QuoteChange ocurrs'
      '\nThen emit prev state with changed quote and saveFailureOrSuccessOption: none()',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.quoteChange(newQuote));
      },
      seed: initialState,
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            quote: HighlightQuote(newQuote),
          ),
          saveFailureOrSuccessOption: none(),
        ),
      ],
    );
  });

  group('_ColorChange', () {
    final newColor = HighlightColor.predefinedColors[3];
    blocTest(
      '\nGiven any state'
      '\nWhen _ColorChange ocurrs'
      '\nThen emit prev state with changed color and saveFailureOrSuccessOption: none()',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(HighlightFormEvent.colorChange(newColor));
      },
      seed: initialState,
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            color: HighlightColor(newColor),
          ),
          saveFailureOrSuccessOption: none(),
        ),
      ],
    );
  });

  group('_BookTitleChanged', () {
    const newBookTitle = 'title';
    blocTest(
      '\nGiven any state'
      '\nWhen _BookTitleChanged ocurrs'
      '\nThen emit prev state with changed bookTitle and saveFailureOrSuccessOption: none()',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.bookTitleChanged(newBookTitle));
      },
      seed: initialState,
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            bookTitle: BookTitle(newBookTitle),
          ),
          saveFailureOrSuccessOption: none(),
        ),
      ],
    );
  });

  group('_PageNumberChanged', () {
    const newPageNumber = '666';
    blocTest(
      '\nGiven any state'
      '\nWhen _BookTitleChanged ocurrs'
      '\nThen emit prev state with changed pageNumber and saveFailureOrSuccessOption: none()',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.pageNumberChanged(newPageNumber));
      },
      seed: initialState,
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            pageNumber: QuotePage(newPageNumber),
          ),
          saveFailureOrSuccessOption: none(),
        ),
      ],
    );
  });

  group('_ImageUrlChanged', () {
    const newImageUrl = 'http://newimageurl.test';
    blocTest(
      '\nGiven any state'
      '\nWhen _ImageUrlChanged ocurrs'
      '\nThen emit prev state with changed url and saveFailureOrSuccessOption: none()',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.imageUrlChanged(newImageUrl));
      },
      seed: initialState,
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            imageUrl: ImageUrl(newImageUrl),
          ),
          saveFailureOrSuccessOption: none(),
        ),
      ],
    );
  });

  group('_Saved', () {
    final validHighlight = Highlight(
      id: UniqueId(),
      quote: HighlightQuote('This is a valid quote'),
      color: HighlightColor(HighlightColor.predefinedColors[0]),
      imageUrl: ImageUrl('http://validurl.test'),
      bookTitle: BookTitle('title'),
      pageNumber: QuotePage('333'),
    );

    final seedState = initialState.copyWith(highlight: validHighlight);

    blocTest(
      '\nGiven current Highlight without errors'
      '\nWhen create succesfully'
      '\nThen emitt same state with saveFailureOrSuccessOption: some(unit)',
      build: () {
        when(mockIHighlightRepository.create(any))
            .thenAnswer((_) async => right(unit));
        return HighlightFormBloc(mockIHighlightRepository);
      },
      seed: seedState,
      act: (bloc) {
        bloc.add(const HighlightFormEvent.saved());
      },
      expect: [
        seedState.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        ),
        seedState.copyWith(
          isSaving: false,
          saveFailureOrSuccessOption: some(right(unit)),
        ),
      ],
      verify: (_) {
        verify(
          mockIHighlightRepository.create(seedState.highlight),
        ).called(1);
        verifyNever(
          mockIHighlightRepository.update(seedState.highlight),
        );
      },
    );

    blocTest(
      '\nGiven current Highlight without errors'
      '\nWhen update succesfully'
      '\nThen emitt same state with saveFailureOrSuccessOption: some(unit)',
      build: () {
        when(mockIHighlightRepository.update(any))
            .thenAnswer((_) async => right(unit));
        return HighlightFormBloc(mockIHighlightRepository);
      },
      seed: seedState.copyWith(isEditing: true),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.saved());
      },
      expect: [
        seedState.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
          isEditing: true,
        ),
        seedState.copyWith(
          isSaving: false,
          saveFailureOrSuccessOption: some(right(unit)),
          isEditing: true,
        ),
      ],
      verify: (_) {
        verifyNever(
          mockIHighlightRepository.create(seedState.highlight),
        );
        verify(
          mockIHighlightRepository.update(seedState.highlight),
        ).called(1);
      },
    );

    blocTest(
      '\nGiven current Highlight without errors'
      '\nWhen create failed'
      '\nThen emitt same state with saveFailureOrSuccessOption: some(HighlightFailure)',
      build: () {
        when(mockIHighlightRepository.create(any))
            .thenAnswer((_) async => left(const HighlightFailure.unexpected()));
        return HighlightFormBloc(mockIHighlightRepository);
      },
      seed: seedState,
      act: (bloc) {
        bloc.add(const HighlightFormEvent.saved());
      },
      expect: [
        seedState.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        ),
        seedState.copyWith(
          isSaving: false,
          saveFailureOrSuccessOption: some(
            left(const HighlightFailure.unexpected()),
          ),
        ),
      ],
      verify: (_) {
        verify(
          mockIHighlightRepository.create(seedState.highlight),
        ).called(1);
        verifyNever(
          mockIHighlightRepository.update(seedState.highlight),
        );
      },
    );

    blocTest(
      '\nGiven current Highlight without errors'
      '\nWhen update failed'
      '\nThen emitt same state with saveFailureOrSuccessOption: left(HighlightFailure)',
      build: () {
        when(mockIHighlightRepository.update(any))
            .thenAnswer((_) async => left(const HighlightFailure.unexpected()));
        return HighlightFormBloc(mockIHighlightRepository);
      },
      seed: seedState.copyWith(isEditing: true),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.saved());
      },
      expect: [
        seedState.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
          isEditing: true,
        ),
        seedState.copyWith(
          isSaving: false,
          saveFailureOrSuccessOption: some(
            left(const HighlightFailure.unexpected()),
          ),
          isEditing: true,
        ),
      ],
      verify: (_) {
        verifyNever(
          mockIHighlightRepository.create(seedState.highlight),
        );
        verify(
          mockIHighlightRepository.update(seedState.highlight),
        ).called(1);
      },
    );

    blocTest(
      '\nGiven current Highlight with errors'
      '\nWhen _Saved ocurrs'
      "\nThen don't emitt any new state",
      build: () {
        return HighlightFormBloc(mockIHighlightRepository);
      },
      seed: initialState,
      act: (bloc) {
        bloc.add(const HighlightFormEvent.saved());
      },
      expect: [], // No emition expected
      verify: (_) {
        verifyNever(mockIHighlightRepository.create(seedState.highlight));
        verifyNever(mockIHighlightRepository.update(seedState.highlight));
      },
    );
  });
}
