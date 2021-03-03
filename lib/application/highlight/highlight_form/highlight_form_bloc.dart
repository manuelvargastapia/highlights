import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/quote.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/domain/highlights/i__text_recognition_repostitory.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

part 'highlight_form_event.dart';
part 'highlight_form_state.dart';
part 'highlight_form_bloc.freezed.dart';

@injectable
class HighlightFormBloc extends Bloc<HighlightFormEvent, HighlightFormState> {
  final IHighlightRepository _highlightRepository;
  final ITextRecognitionRepository _textRecognitionRepository;

  HighlightFormBloc(
    this._highlightRepository,
    this._textRecognitionRepository,
  ) : super(HighlightFormState.initial());

  @override
  Stream<HighlightFormState> mapEventToState(
    HighlightFormEvent event,
  ) async* {
    yield* event.map(
      initialized: (event) async* {
        yield event.initialHighlighOption.fold(
          () => state,
          (initialHighlight) => state.copyWith(
            highlight: initialHighlight,
            isEditing: true,
          ),
        );
      },
      quoteChange: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            quote: Quote(
              highlightQuote: HighlightQuote(event.quote),
            ),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      colorChange: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            color: HighlightColor(event.color),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      bookTitleChanged: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            bookTitle: BookTitle(event.bookTitle),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      pageNumberChanged: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            pageNumber: PageNumber(event.pageNumber),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      imageChanged: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            image: some(event.image.toDomain()),
          ),
          isProcessingImage: true,
          saveFailureOrSuccessOption: none(),
        );
        final failureOrQuote = await _textRecognitionRepository
            .processImage(event.image.toDomain());
        yield* failureOrQuote.fold(
          (failure) async* {
            yield state.copyWith(
              isProcessingImage: false,
              saveFailureOrSuccessOption: some(left(failure)),
            );
          },
          (quote) async* {
            yield state.copyWith(
              highlight: state.highlight.copyWith(quote: quote),
              isProcessingImage: false,
              saveFailureOrSuccessOption: none(),
            );
          },
        );
      },
      imageDeleted: (event) async* {
        yield* state.highlight.image.fold(
          // The "none" case will never happen if UI validates properly
          () async* {
            yield state;
          },
          (image) async* {
            Option<Either<HighlightFailure, Unit>> failureOption = none();

            // Delete image from Firebase Storage only if it's actually there
            // (otherwhise, HighlightRepository returns a failure)
            if (image.isUploaded) {
              final failureOrUnit = await _highlightRepository.deleteImage(
                state.highlight,
              );

              // We need specify none() or some() because we won't to pop
              // untinl overview page in presentation layer
              failureOrUnit.fold(
                (failure) {
                  failureOption = some(left(failure));
                },
                (_) {},
              );
            }

            yield state.copyWith(
              highlight: state.highlight.copyWith(
                image: failureOption.isSome() ? some(image) : none(),
              ),
              saveFailureOrSuccessOption: failureOption,
            );
          },
        );
      },
      saved: (event) async* {
        if (state.highlight.failureOption.isNone()) {
          yield state.copyWith(
            isSaving: true,
            saveFailureOrSuccessOption: none(),
          );

          final failureOrSuccess = state.isEditing
              ? await _highlightRepository.update(state.highlight)
              : await _highlightRepository.create(state.highlight);

          yield state.copyWith(
            isSaving: false,
            saveFailureOrSuccessOption: optionOf(failureOrSuccess),
          );
        }
      },
    );
  }
}
