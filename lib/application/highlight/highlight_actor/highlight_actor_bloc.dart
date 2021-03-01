import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

part 'highlight_actor_event.dart';
part 'highlight_actor_state.dart';
part 'highlight_actor_bloc.freezed.dart';

@injectable
class HighlightActorBloc
    extends Bloc<HighlightActorEvent, HighlightActorState> {
  final IHighlightRepository _highlightRepository;

  HighlightActorBloc(this._highlightRepository) : super(const _Initial());

  @override
  Stream<HighlightActorState> mapEventToState(
    HighlightActorEvent event,
  ) async* {
    yield* event.map(
      deleted: (event) async* {
        yield const HighlightActorState.actionInProgress();
        final failureOrUnit = await _highlightRepository.delete(
          event.highlight,
        );
        yield failureOrUnit.fold(
          (failure) => HighlightActorState.deleteFailure(failure),
          (_) => const HighlightActorState.deleteSuccess(),
        );
      },
      // TODO: test
      imageUploaded: (event) async* {
        yield const HighlightActorState.actionInProgress();
        final failureOrUnit = await _highlightRepository.uploadImage(
          event.image.toDomain(),
        );
        yield failureOrUnit.fold(
          (failure) => HighlightActorState.uploadImageFailure(failure),
          (image) => HighlightActorState.uploadImageSuccess(image),
        );
      },
    );
  }
}
