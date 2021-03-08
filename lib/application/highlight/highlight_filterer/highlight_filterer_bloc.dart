import 'dart:async';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/highlights/value_objects.dart';
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
      showOnlyIfHasImageToggled: (event) async* {
        yield state.copyWith(
          filters: state.filters.copyWith(
            showOnlyIfHasImage: !state.filters.showOnlyIfHasImage,
          ),
        );
      },
      // TODO: test
      filterByColorMatch: (event) async* {
        yield state.copyWith(
          filters: state.filters.copyWith(
            colorMatchOption: event.colorOption.fold(
              () => none(),
              (c) => some(HighlightColor(c)),
            ),
          ),
        );
      },
      // TODO: test
      orderByOptionChanged: (event) async* {
        yield state.copyWith(
          filters: state.filters.copyWith(
            orderByOption: event.option,
          ),
        );
      },
      // TODO: test
      descendingOrderToggled: (event) async* {
        yield state.copyWith(
          filters: state.filters.copyWith(
            descendingOrder: !state.filters.descendingOrder,
          ),
        );
      },
    );
  }
}
