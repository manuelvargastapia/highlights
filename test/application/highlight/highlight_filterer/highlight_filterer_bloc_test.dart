import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';

void main() {
  final initialState = HighlightFiltererState.initial();
  group('_ShowOnlyIfHasImageToggled', () {
    blocTest<HighlightFiltererBloc, HighlightFiltererState>(
      '\nGiven event triggered'
      '\nWhen showOnlyIfHasImage is false'
      '\nThen emmit copied state with showOnlyIfHasImage true',
      build: () => HighlightFiltererBloc(),
      seed: initialState,
      act: (bloc) {
        bloc.add(const HighlightFiltererEvent.showOnlyIfHasImageToggled());
      },
      expect: [
        HighlightFiltererState.initial().copyWith(
          filters: initialState.filters.copyWith(showOnlyIfHasImage: true),
        ),
      ],
    );

    blocTest<HighlightFiltererBloc, HighlightFiltererState>(
      '\nGiven event triggered'
      '\nWhen showOnlyIfHasImage is true'
      '\nThen emmit copied state with showOnlyIfHasImage false',
      build: () => HighlightFiltererBloc(),
      seed: initialState.copyWith(
        filters: initialState.filters.copyWith(showOnlyIfHasImage: true),
      ),
      act: (bloc) {
        bloc.add(const HighlightFiltererEvent.showOnlyIfHasImageToggled());
      },
      expect: [
        HighlightFiltererState.initial().copyWith(
          filters: initialState.filters.copyWith(showOnlyIfHasImage: false),
        ),
      ],
    );
  });
}
