import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' hide Image;

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/highlights/quote.dart';
import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/critical_failure_display.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/error_highlight_card.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/highlight_card.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/highlight_overview_body.dart';

class MockHighlightWatcherBloc extends MockBloc<HighlightWatcherState>
    implements HighlightWatcherBloc {}

void main() {
  MockHighlightWatcherBloc mockHighlightWatcherBloc;

  setUp(() {
    mockHighlightWatcherBloc = MockHighlightWatcherBloc();
  });

  group('HighlightOverviewBody', () {
    Widget renderWidget() {
      return BlocProvider<HighlightWatcherBloc>.value(
        value: mockHighlightWatcherBloc,
        child: MaterialApp(
          home: Scaffold(
            body: HighlightOverviewBody(),
          ),
        ),
      );
    }

    testWidgets(
      '\nGiven _Initial state'
      '\nWhen listen bloc'
      '\nThen render empty Container',
      (tester) async {
        when(
          mockHighlightWatcherBloc.state,
        ).thenReturn(
          const HighlightWatcherState.initial(),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.byType(Container), findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven _LoadInProgress state'
      '\nWhen listen bloc'
      '\nThen render CircularProgressIndicator',
      (tester) async {
        when(
          mockHighlightWatcherBloc.state,
        ).thenReturn(
          const HighlightWatcherState.loadInProgress(),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven _LoadSuccess state'
      '\nWhen there are no Highlights'
      '\nThen render empty list',
      (tester) async {
        when(
          mockHighlightWatcherBloc.state,
        ).thenReturn(
          const HighlightWatcherState.loadSuccess(KtList.empty()),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.byType(ListView), findsNothing);
        expect(find.byType(HighlightCard), findsNothing);
        expect(find.text('NO HIGHLIGHTS'), findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven _LoadSuccess state'
      '\nWhen there are Highlights'
      '\nThen render HighlightCards containing each Highlight',
      (tester) async {
        when(
          mockHighlightWatcherBloc.state,
        ).thenReturn(
          HighlightWatcherState.loadSuccess(
            KtList.from([
              Highlight(
                id: UniqueId.fromUniqueString('1'),
                quote: Quote(
                  highlightQuote: HighlightQuote('Quote 1'),
                ),
                color: HighlightColor(HighlightColor.predefinedColors[1]),
                image: some(Image(
                  imageUrl: some(ImageUrl('https://1.test')),
                  imageFile: none(),
                )),
                bookTitle: BookTitle('title 1'),
                pageNumber: PageNumber('111'),
              ),
              Highlight(
                id: UniqueId.fromUniqueString('2'),
                quote: Quote(
                  highlightQuote: HighlightQuote('Quote 2'),
                ),
                color: HighlightColor(HighlightColor.predefinedColors[2]),
                image: some(Image(
                  imageUrl: some(ImageUrl('https://2.test')),
                  imageFile: none(),
                )),
                bookTitle: BookTitle('title 2'),
                pageNumber: PageNumber('222'),
              ),
              Highlight(
                id: UniqueId.fromUniqueString('3'),
                quote: Quote(
                  highlightQuote: HighlightQuote('Quote 3'),
                ),
                color: HighlightColor(HighlightColor.predefinedColors[3]),
                image: some(Image(
                  imageUrl: some(ImageUrl('https://3.test')),
                  imageFile: none(),
                )),
                bookTitle: BookTitle('title 3'),
                pageNumber: PageNumber('333'),
              ),
            ]),
          ),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(HighlightCard), findsNWidgets(3));
        expect(find.text('Quote 1'), findsOneWidget);
        expect(find.text('Quote 2'), findsOneWidget);
        expect(find.text('Quote 3'), findsOneWidget);
        expect(find.text('title 1'), findsOneWidget);
        expect(find.text('title 2'), findsOneWidget);
        expect(find.text('title 3'), findsOneWidget);
        expect(find.text('111'), findsOneWidget);
        expect(find.text('222'), findsOneWidget);
        expect(find.text('333'), findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven _LoadSuccess state'
      '\nWhen a Highlight carries a failure'
      '\nThen render ErrorHighlightCard containing the Highlight',
      (tester) async {
        when(
          mockHighlightWatcherBloc.state,
        ).thenReturn(
          HighlightWatcherState.loadSuccess(
            KtList.from([
              Highlight.empty(),
              Highlight(
                id: UniqueId.fromUniqueString('1'),
                quote: Quote(
                  highlightQuote: HighlightQuote('Quote 1'),
                ),
                color: HighlightColor(HighlightColor.predefinedColors[1]),
                image: some(
                  Image(
                    imageUrl: some(ImageUrl('https://1.test')),
                    imageFile: none(),
                  ),
                ),
                bookTitle: BookTitle('title 1'),
                pageNumber: PageNumber('111'),
              ),
            ]),
          ),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(HighlightCard), findsNWidgets(1));
        expect(find.text('Quote 1'), findsOneWidget);
        expect(find.text('title 1'), findsOneWidget);
        expect(find.text('111'), findsOneWidget);
        expect(find.byType(ErrorHighlightCard), findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven _LoadFailure state'
      '\nWhen listen bloc'
      '\nThen render CriticalFailureDisplay with failure',
      (tester) async {
        when(
          mockHighlightWatcherBloc.state,
        ).thenReturn(
          const HighlightWatcherState.loadFailure(
            HighlightFailure.unexpected(),
          ),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.byType(ListView), findsNothing);
        expect(find.byType(HighlightCard), findsNothing);
        expect(find.byType(CriticalFailureDisplay), findsOneWidget);
      },
    );
  });
}
