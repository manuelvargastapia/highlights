import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/infrastructure/highlight/highlight_repository.dart';
import 'package:highlights/presentation/highlight/highlight_forms/misc/quote_info_presentation_classes.dart';

part 'highlight_form_event.dart';
part 'highlight_form_state.dart';
part 'highlight_form_bloc.freezed.dart';

@injectable
class HighlightFormBloc extends Bloc<HighlightFormEvent, HighlightFormState> {
  final HighlightRepository _highlightRepository;

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
      quoteInfoChanged: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            info: event.info.toDomain(),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      imageUrlChanged: (event) async* {
        yield state.copyWith(
          highlight: state.highlight.copyWith(
            imageUrl: ImageUrl(event.imageUrl),
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
