import 'package:flutter/material.dart' hide Router;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:mockito/mockito.dart';
import 'package:auto_route/auto_route.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/presentation/routes/router.gr.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';

import '../../../firebase_setup_mock.dart';

class MockHighlightWatcherBloc extends MockBloc<HighlightWatcherState>
    implements HighlightWatcherBloc {}

class MockHighlightActorBloc extends MockBloc<HighlightActorState>
    implements HighlightActorBloc {}

class MockAuthBloc extends MockBloc<AuthState> implements AuthBloc {}

void main() {
  configureInjection();
  setupFirestoreMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  MockHighlightWatcherBloc mockHighlightWatcherBloc;
  MockHighlightActorBloc mockHighlightActorBloc;
  MockAuthBloc mockAuthBloc;

  setUp(() {
    mockHighlightWatcherBloc = MockHighlightWatcherBloc();
    mockHighlightActorBloc = MockHighlightActorBloc();
    mockAuthBloc = MockAuthBloc();
  });

  group('HighlightOverviewPage', () {
    Widget renderWidget() {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>.value(
            value: mockAuthBloc,
          ),
          BlocProvider<HighlightWatcherBloc>.value(
            value: mockHighlightWatcherBloc,
          ),
          BlocProvider<HighlightActorBloc>.value(
            value: mockHighlightActorBloc,
          ),
        ],
        child: MaterialApp(
          builder: ExtendedNavigator.builder<Router>(
            router: Router(),
            initialRoute: '/highlight-overview-page',
          ),
        ),
      );
    }

    testWidgets(
      '\nGiven authenticated user'
      '\nWhen enters to HighlightOverviewPage'
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
        final searchIcon = find.widgetWithIcon(AppBar, Icons.search);
        final addFAB = find.widgetWithIcon(FloatingActionButton, Icons.add);

        expect(titleText, findsOneWidget);
        expect(exitIcon, findsOneWidget);
        expect(searchIcon, findsOneWidget);
        expect(addFAB, findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven authenticated user'
      '\nWhen _Unexpected error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        // runAsync is required to properly expect for FlushBar message
        await tester.runAsync(() async {
          when(
            mockHighlightWatcherBloc.state,
          ).thenReturn(
            const HighlightWatcherState.loadInProgress(),
          );

          whenListen(
            mockHighlightActorBloc,
            Stream.fromIterable([
              const HighlightActorState.deleteFailure(
                HighlightFailure.unexpected(),
              )
            ]),
          );

          await tester.pumpWidget(renderWidget());

          // Required to reach a stable state to listen blocs
          await tester.pump();

          final errorMessage = find.text(
            'Unexpected error occurred while deleting. Please contact support.',
          );

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    testWidgets(
      '\nGiven authenticated user'
      '\nWhen _InsufficientPermission error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        await tester.runAsync(() async {
          when(
            mockHighlightWatcherBloc.state,
          ).thenReturn(
            const HighlightWatcherState.loadInProgress(),
          );

          whenListen(
            mockHighlightActorBloc,
            Stream.fromIterable([
              const HighlightActorState.deleteFailure(
                HighlightFailure.insufficientPermission(),
              )
            ]),
          );

          await tester.pumpWidget(renderWidget());

          // Required to reach a stable state to listen blocs
          await tester.pump();

          final errorMessage = find.text('Insufficient permissions.');

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    testWidgets(
      '\nGiven authenticated user'
      '\nWhen _UnableToUpdate error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        await tester.runAsync(() async {
          when(
            mockHighlightWatcherBloc.state,
          ).thenReturn(
            const HighlightWatcherState.loadInProgress(),
          );

          whenListen(
            mockHighlightActorBloc,
            Stream.fromIterable([
              const HighlightActorState.deleteFailure(
                HighlightFailure.unableToUpdate(),
              )
            ]),
          );

          await tester.pumpWidget(renderWidget());

          // Required to reach a stable state to listen blocs
          await tester.pump();

          final errorMessage = find.text(
            'Unexpected error occurred while deleting. Please contact support.',
          );

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    // TODO: doesn't work. auto_route makes the UI testing impossible
    // testWidgets(
    //   '\nGiven unauthenticated user'
    //   '\nWhen enters to HighlightOverviewPage'
    //   '\nThen navigate to SignInPage',
    //   (tester) async {
    //     when(
    //       mockHighlightWatcherBloc.state,
    //     ).thenReturn(
    //       const HighlightWatcherState.loadInProgress(),
    //     );

    //     whenListen(
    //       mockAuthBloc,
    //       Stream.fromIterable([const AuthState.unauthenticated()]),
    //     );

    //     await tester.pumpWidget(renderWidget());

    //     // Required to reach a stable state to listen blocs
    //     await tester.pumpAndSettle();

    //     expect(find.byType(SignInPage), findsOneWidget);
    //   },
    // );
  });
}
