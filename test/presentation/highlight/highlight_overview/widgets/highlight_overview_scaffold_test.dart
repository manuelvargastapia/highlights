import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/filters_dialog/filters_bar.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/highlight_overview_scaffold.dart';

class MockHighlightWatcherBloc extends MockBloc<HighlightWatcherState>
    implements HighlightWatcherBloc {}

void main() {
  configureInjection();

  MockHighlightWatcherBloc mockHighlightWatcherBloc;

  setUp(() {
    mockHighlightWatcherBloc = MockHighlightWatcherBloc();
  });

  group('HighlightOverviewScaffold', () {
    Widget renderWidget() {
      return BlocProvider<HighlightWatcherBloc>.value(
        value: mockHighlightWatcherBloc,
        child: const MaterialApp(
          home: HighlightOverviewScaffold(),
        ),
      );
    }

    testWidgets(
      '\nGiven authenticated user'
      '\nWhen enters to HighlightOverviewScaffold'
      '\nThen everything renders correctly',
      (tester) async {
        when(
          mockHighlightWatcherBloc.state,
        ).thenReturn(
          const HighlightWatcherState.loadInProgress(),
        );

        await tester.pumpWidget(renderWidget());

        final titleText = find.widgetWithText(AppBar, 'Highlights');
        final exitIcon = find.widgetWithIcon(AppBar, Icons.exit_to_app);
        final filtersBar = find.byType(FiltersBar);
        final addFAB = find.widgetWithIcon(FloatingActionButton, Icons.add);

        expect(titleText, findsOneWidget);
        expect(exitIcon, findsOneWidget);
        expect(filtersBar, findsOneWidget);
        expect(addFAB, findsOneWidget);
      },
    );
  });
}
