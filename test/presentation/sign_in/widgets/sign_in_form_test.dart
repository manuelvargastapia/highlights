import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/injection.dart';
import 'package:highlights/presentation/sign_in/widgets/sign_in_form.dart';

import '../../../firebase_setup_mock.dart';

class MockSignInFormBloc extends MockBloc<SignInFormState>
    implements SignInFormBloc {}

void main() {
  configureInjection();
  setupFirestoreMocks();

  MockSignInFormBloc mockSignInFormBloc;

  setUpAll(() async {
    await Firebase.initializeApp();
    mockSignInFormBloc = MockSignInFormBloc();
  });

  group('SignInForm', () {
    Widget renderWidget() => MaterialApp(
          home: Scaffold(
            body: BlocProvider<SignInFormBloc>.value(
              value: mockSignInFormBloc,
              child: SignInForm(),
            ),
          ),
        );

    testWidgets(
      '\nGiven unauthenticated user'
      '\nWhen invalid email is inputted'
      '\nThen show corresponding error message',
      (tester) async {
        const invalidEmail = 'invalid_email';
        whenListen(
          mockSignInFormBloc,
          Stream.fromIterable([
            SignInFormState.initial().copyWith(
              emailAddress: EmailAddress(invalidEmail),
              authFailureOrSuccessOption: none(),
            )
          ]),
        );
        when(mockSignInFormBloc.state).thenReturn(SignInFormState.initial());
        await tester.pumpWidget(renderWidget());
        expect(find.text('Invalid Email'), findsNothing);
        expect(find.text('Short Password'), findsNothing);
        final emailField = find.widgetWithText(TextFormField, 'Email');
        await tester.enterText(emailField, invalidEmail);
        await tester.pump();
        expect(find.text('Invalid Email'), findsOneWidget);
        expect(find.text('Short Password'), findsNothing);
      },
    );
    testWidgets(
      '\nGiven unauthenticated user'
      '\nWhen short password is inputted'
      '\nThen show corresponding error message',
      (tester) async {
        const shortPassword = '1234';
        when(mockSignInFormBloc.state).thenReturn(
          SignInFormState.initial(),
        );
        whenListen(
          mockSignInFormBloc,
          Stream.fromIterable([
            SignInFormState.initial().copyWith(
              password: Password(shortPassword),
              authFailureOrSuccessOption: none(),
            )
          ]),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.text('Invalid Email'), findsNothing);
        expect(find.text('Short Password'), findsNothing);
        final passwordField = find.widgetWithText(TextFormField, 'Password');
        await tester.enterText(passwordField, shortPassword);
        await tester.pump();
        expect(find.text('Short Password'), findsOneWidget);
        expect(find.text('Invalid Email'), findsNothing);
      },
    );
    testWidgets(
      '\nGiven unauthenticated user'
      '\nWhen "SIGN IN" button is pressed'
      '\nThen show both error messages',
      (tester) async {
        when(mockSignInFormBloc.state).thenReturn(
          SignInFormState.initial(),
        );
        whenListen(
          mockSignInFormBloc,
          Stream.fromIterable([SignInFormState.initial()]),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.text('Invalid Email'), findsNothing);
        expect(find.text('Short Password'), findsNothing);
        final signInButton = find.widgetWithText(FlatButton, 'SIGN IN');
        await tester.tap(signInButton);
        await tester.pump();
        expect(find.text('Invalid Email'), findsOneWidget);
        expect(find.text('Short Password'), findsOneWidget);
      },
    );
    testWidgets(
      '\nGiven unauthenticated user'
      '\nWhen "REGISTER" button is pressed'
      '\nThen show both form error messages',
      (tester) async {
        when(mockSignInFormBloc.state).thenReturn(
          SignInFormState.initial(),
        );
        whenListen(
          mockSignInFormBloc,
          Stream.fromIterable([SignInFormState.initial()]),
        );
        await tester.pumpWidget(renderWidget());
        expect(find.text('Invalid Email'), findsNothing);
        expect(find.text('Short Password'), findsNothing);
        final registerButton = find.widgetWithText(FlatButton, 'REGISTER');
        await tester.tap(registerButton);
        await tester.pump();
        expect(find.text('Invalid Email'), findsOneWidget);
        expect(find.text('Short Password'), findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven sign in with Google dialog open'
      '\nWhen _CancelledByUser error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        await tester.runAsync(() async {
          whenListen(
            mockSignInFormBloc,
            Stream.fromIterable([
              SignInFormState.initial().copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(
                  const Left(AuthFailure.cancelledByUser()),
                ),
              ),
            ]),
          );

          await tester.pumpWidget(renderWidget());
          await tester.pump();

          final errorMessage = find.text('Cancelled');

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    testWidgets(
      '\nGiven any auth method is in progress'
      '\nWhen _ServerError error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        await tester.runAsync(() async {
          when(mockSignInFormBloc.state).thenReturn(SignInFormState.initial());
          whenListen(
            mockSignInFormBloc,
            Stream.fromIterable([
              SignInFormState.initial().copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(
                  const Left(AuthFailure.serverError()),
                ),
              ),
            ]),
          );

          await tester.pumpWidget(renderWidget());
          await tester.pump();

          final errorMessage = find.text('Server Error');

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    testWidgets(
      '\nGiven sign in with email and password'
      '\nWhen _InvalidEmailAndPasswordCombination error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        await tester.runAsync(() async {
          when(mockSignInFormBloc.state).thenReturn(SignInFormState.initial());
          whenListen(
            mockSignInFormBloc,
            Stream.fromIterable([
              SignInFormState.initial().copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(
                  const Left(AuthFailure.invalidEmailAndPasswordCombination()),
                ),
              ),
            ]),
          );

          await tester.pumpWidget(renderWidget());
          await tester.pump();

          final errorMessage = find.text(
            'Invalid email and password combination',
          );

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    testWidgets(
      '\nGiven registering with email and password'
      '\nWhen _EmailAlreadyInUse error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        await tester.runAsync(() async {
          when(mockSignInFormBloc.state).thenReturn(SignInFormState.initial());
          whenListen(
            mockSignInFormBloc,
            Stream.fromIterable([
              SignInFormState.initial().copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(
                  const Left(AuthFailure.emailAlreadyInUse()),
                ),
              ),
            ]),
          );

          await tester.pumpWidget(renderWidget());
          await tester.pump();

          final errorMessage = find.text('Email already in use');

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    testWidgets(
      '\nGiven sign in with any method'
      '\nWhen _OperationNotAllowed error ocurrs'
      '\nThen show corresponding message',
      (tester) async {
        await tester.runAsync(() async {
          when(mockSignInFormBloc.state).thenReturn(SignInFormState.initial());
          whenListen(
            mockSignInFormBloc,
            Stream.fromIterable([
              SignInFormState.initial().copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(
                  const Left(AuthFailure.operationNotAllowed()),
                ),
              ),
            ]),
          );

          await tester.pumpWidget(renderWidget());
          await tester.pump();

          final errorMessage = find.text('User blocked');

          expect(errorMessage, findsOneWidget);
        });
      },
    );

    testWidgets(
      '\nGiven any auth method in progress'
      '\nWhen isSubmitting is true'
      '\nThen find LinearProgressIndicator',
      (tester) async {
        when(mockSignInFormBloc.state).thenReturn(
          SignInFormState.initial().copyWith(isSubmitting: true),
        );

        await tester.pumpWidget(renderWidget());

        expect(find.byType(LinearProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      '\nGiven any auth method in progress'
      '\nWhen isSubmitting is false'
      '\nThen no LinearProgressIndicator is found',
      (tester) async {
        when(mockSignInFormBloc.state).thenReturn(
          SignInFormState.initial().copyWith(isSubmitting: false),
        );

        await tester.pumpWidget(renderWidget());

        expect(find.byType(LinearProgressIndicator), findsNothing);
      },
    );

    // TODO: test SIGN IN WITH GOOGLE cases
    // testWidgets(
    //   '\nGiven unauthenticated user'
    //   '\nWhen 'SIGN IN WITH GOOGLE' button is pressed'
    //   '\nThen 'Choose and account' dialog is shown',
    //   (tester) async {
    //     final firstState = SignInFormState.initial().copyWith(
    //       isSubmitting: true,
    //       authFailureOrSuccessOption: none(),
    //     );
    //     final secondState = firstState.copyWith(
    //       isSubmitting: false,
    //       authFailureOrSuccessOption: some(right(unit)),
    //     );
    //     when(mockSignInFormBloc.mapEventToState(
    //       const SignInFormEvent.sigInWithGooglePessed(),
    //     )).thenReturn(
    //       Stream.fromIterable([firstState, secondState]),
    //     );
    //     await tester.pumpWidget(renderWidget());
    //     final signInWithGoogleButton = find.widgetWithText(
    //       RaisedButton,
    //       'SIGN IN WITH GOOGLE',
    //     );
    //     await tester.tap(signInWithGoogleButton);
    //     await tester.pump();
    //     expect(find.text('Choose an account'), findsOneWidget);
    //   },
    // );

    // TODO: test navigation ('SIGN IN' and 'SIGN IN WITH GOOGLE' buttons)
  });
}
