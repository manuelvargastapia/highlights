import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/highlight_search_filter.dart';

part 'highlight_filterer_event.dart';
part 'highlight_filterer_state.dart';
part 'highlight_filterer_bloc.freezed.dart';

@injectable
class HighlightFiltererBloc
    extends Bloc<HighlightFiltererEvent, HighlightFiltererState> {
  HighlightFiltererBloc() : super(HighlightFiltererState.initial());

  @override
  Stream<HighlightFiltererState> mapEventToState(
    HighlightFiltererEvent event,
  ) async* {
    yield* event.map(
      hasImageToggled: (event) async* {
        yield state.copyWith(
          filters: state.filters.copyWith(
            hasImage: !state.filters.hasImage,
          ),
        );
      },
    );
  }
}
