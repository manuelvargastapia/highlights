import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:highlights/domain/highlights/image.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/domain/highlights/i_highlight_repository.dart';

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
            image: event.image,
          ),
          saveFailureOrSuccessOption: none(),
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
