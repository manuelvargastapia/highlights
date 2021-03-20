import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

part 'highlight_form_event.dart';
part 'highlight_form_state.dart';
part 'highlight_form_bloc.freezed.dart';

@injectable
class HighlightFormBloc extends Bloc<HighlightFormEvent, HighlightFormState> {
  final IHighlightRepository _highlightRepository;

  HighlightFormBloc(this._highlightRepository)
      : super(HighlightFormState.initial());

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
            quote: HighlightQuote(event.quote),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      quoteChangeByTextRecognition: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            quote: HighlightQuote(event.quote),
          ),
          quoteExtractedFromImage: true,
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
          saveFailureOrSuccessOption: none(),
        );
      },
      imageDeleted: (event) async* {
        yield* state.highlight.image.fold(
          // The "none" case will never happen if UI validates properly
          () async* {
            yield state;
          },
          // yield a new state without image and set deleteImageFromStorage
          // according to current upload state (i. e., delete it from storage
          // only if it's already uploaded)
          (image) async* {
            yield state.copyWith(
              highlight: state.highlight.copyWith(
                image: none(),
              ),
              saveFailureOrSuccessOption: none(),
              deleteImageFromStorage: image.isUploaded,
            );
          },
        );
      },
      saved: (event) async* {
        Either<HighlightFailure, Unit> failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        );

        // Update/create highlight only if there is no failures. Then,
        // delete image from storage if requested and catch the possible
        // failure. Only if there is no failure after trying to delete the
        // image, call to update/create. If there is no need for deleting
        // image, simply call update/create.
        if (state.highlight.failureOption.isNone()) {
          if (state.deleteImageFromStorage) {
            final failureOrUnit = await _highlightRepository.deleteImage(
              state.highlight,
            );

            yield* failureOrUnit.fold(
              (failure) async* {
                yield state.copyWith(
                  isSaving: false,
                  saveFailureOrSuccessOption: some(left(failure)),
                );
              },
              (_) async* {
                failureOrSuccess = state.isEditing
                    ? await _highlightRepository.update(state.highlight)
                    : await _highlightRepository.create(state.highlight);
                yield state.copyWith(
                  isSaving: false,
                  saveFailureOrSuccessOption: some(failureOrSuccess),
                );
              },
            );
          } else {
            failureOrSuccess = state.isEditing
                ? await _highlightRepository.update(state.highlight)
                : await _highlightRepository.create(state.highlight);
          }
        }

        yield state.copyWith(
          isSaving: false,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
