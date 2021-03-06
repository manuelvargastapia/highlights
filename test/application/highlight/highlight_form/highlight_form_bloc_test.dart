import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

class MockIHighlightRepository extends Mock implements IHighlightRepository {}

void main() {
  MockIHighlightRepository mockIHighlightRepository;
  final initialState = HighlightFormState.initial();

  setUp(() {
    mockIHighlightRepository = MockIHighlightRepository();
  });

  group('_Initialized', () {
    final emptyHighlight = Highlight.empty();

    blocTest<HighlightFormBloc, HighlightFormState>(
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

    blocTest<HighlightFormBloc, HighlightFormState>(
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
    blocTest<HighlightFormBloc, HighlightFormState>(
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

  group('_QuoteChangeByTextRecognition', () {
    const newQuote = 'new quote';
    blocTest<HighlightFormBloc, HighlightFormState>(
      '\nGiven any state'
      '\nWhen _QuoteChangeByTextRecognition ocurrs'
      '\nThen emit prev state with changed quote, quoteExtractedFromImage: true and saveFailureOrSuccessOption: none()',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(
            const HighlightFormEvent.quoteChangeByTextRecognition(newQuote));
      },
      seed: initialState,
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            quote: HighlightQuote(newQuote),
          ),
          quoteExtractedFromImage: true,
          saveFailureOrSuccessOption: none(),
        ),
      ],
    );
  });

  group('_ColorChange', () {
    final newColor = HighlightColor.predefinedColors[3];
    blocTest<HighlightFormBloc, HighlightFormState>(
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
    blocTest<HighlightFormBloc, HighlightFormState>(
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
    blocTest<HighlightFormBloc, HighlightFormState>(
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
            pageNumber: PageNumber(newPageNumber),
          ),
          saveFailureOrSuccessOption: none(),
        ),
      ],
    );
  });

  group('_ImageChanged', () {
    final newImage = Image(
      imageUrl: some(ImageUrl('http://newimageurl.test')),
      imageFile: some(ImageFile(File('new/path'))),
    );

    blocTest<HighlightFormBloc, HighlightFormState>(
      '\nGiven any state'
      '\nWhen _ImageChanged ocurrs'
      '\nThen emit state with new image',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(HighlightFormEvent.imageChanged(
          ImagePrimitive.fromDomain(newImage),
        ));
      },
      seed: initialState,
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            image: some(newImage),
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
      image: some(Image(
        imageUrl: some(ImageUrl('http://validurl.test')),
        imageFile: none(),
      )),
      bookTitle: BookTitle('title'),
      pageNumber: PageNumber('333'),
    );

    final seedState = initialState.copyWith(highlight: validHighlight);

    blocTest<HighlightFormBloc, HighlightFormState>(
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

    blocTest<HighlightFormBloc, HighlightFormState>(
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

    blocTest<HighlightFormBloc, HighlightFormState>(
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

    blocTest<HighlightFormBloc, HighlightFormState>(
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

    blocTest<HighlightFormBloc, HighlightFormState>(
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

  group('_ImageDeleted', () {
    final image = Image(
      imageUrl: some(ImageUrl('http://newimageurl.test')),
      imageFile: some(ImageFile(File('new/path'))),
    );
    blocTest<HighlightFormBloc, HighlightFormState>(
      '\nGiven curent image is none()'
      '\nWhen _ImageChanged ocurrs'
      '\nThen emit previous state without changes',
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.imageDeleted());
      },
      seed: initialState,
      expect: [], // No changes because state remains the same
      verify: (_) {
        verifyNever(mockIHighlightRepository.deleteImage(any));
      },
    );

    blocTest<HighlightFormBloc, HighlightFormState>(
      '\nGiven curent image is uploaded'
      '\nWhen _ImageChanged ocurrs and image is deleted succesfully'
      '\nThen emit previous state with image: none() and saveFailureOrSuccessOption: none()',
      build: () {
        when(mockIHighlightRepository.deleteImage(any)).thenAnswer(
          (_) async => right(unit),
        );
        return HighlightFormBloc(mockIHighlightRepository);
      },
      act: (bloc) {
        bloc.add(const HighlightFormEvent.imageDeleted());
      },
      seed: initialState.copyWith(
        highlight: initialState.highlight.copyWith(
          image: some(
            Image(
              imageUrl: some(ImageUrl('http://newimageurl.test')),
              imageFile: some(ImageFile(File('new/path'))),
            ),
          ),
        ),
      ),
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(image: none()),
          saveFailureOrSuccessOption: none(),
        ),
      ],
      verify: (_) {
        verify(mockIHighlightRepository.deleteImage(any)).called(1);
      },
    );

    blocTest<HighlightFormBloc, HighlightFormState>(
      '\nGiven curent image is uploaded'
      '\nWhen _ImageChanged ocurrs and image failed to be deleted'
      '\nThen emit previous state with same image and failure',
      build: () {
        when(mockIHighlightRepository.deleteImage(any)).thenAnswer(
          (_) async => left(const HighlightFailure.unableToUpdate()),
        );
        return HighlightFormBloc(mockIHighlightRepository);
      },
      act: (bloc) {
        bloc.add(const HighlightFormEvent.imageDeleted());
      },
      seed: initialState.copyWith(
        highlight: initialState.highlight.copyWith(
          image: some(image),
        ),
      ),
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(
            image: some(image),
          ),
          saveFailureOrSuccessOption: some(
            left(const HighlightFailure.unableToUpdate()),
          ),
        ),
      ],
      verify: (_) {
        verify(mockIHighlightRepository.deleteImage(any)).called(1);
      },
    );

    blocTest<HighlightFormBloc, HighlightFormState>(
      "\nGiven curent image isn't uploaded"
      '\nWhen _ImageChanged ocurrs'
      "\nThen don't call deleteImage() and emit previous state with image: none() and saveFailureOrSuccessOption: none()",
      build: () => HighlightFormBloc(mockIHighlightRepository),
      act: (bloc) {
        bloc.add(const HighlightFormEvent.imageDeleted());
      },
      seed: initialState.copyWith(
        highlight: initialState.highlight.copyWith(
          image: some(
            Image(
              imageUrl: none(), // internally, no URL means non uploaded
              imageFile: some(ImageFile(File('new/path'))),
            ),
          ),
        ),
      ),
      expect: [
        initialState.copyWith(
          highlight: initialState.highlight.copyWith(image: none()),
          saveFailureOrSuccessOption: none(),
        ),
      ],
      verify: (_) {
        verifyNever(mockIHighlightRepository.deleteImage(any));
      },
    );
  });
}
