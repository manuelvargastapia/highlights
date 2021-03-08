import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/presentation/sign_in/sign_in_page.dart';

import '../../setup_firebase_mock.dart';

class MockAuthBloc extends MockBloc<AuthState> implements AuthBloc {}

void main() {
  configureInjection();
  setupFirebaseMock();

  MockAuthBloc mockAuthBloc;

  setUpAll(() async {
    await Firebase.initializeApp();
    mockAuthBloc = MockAuthBloc();
  });

  group('SignInPage', () {
    testWidgets(
      '\nGiven user unauthenticated'
      '\nWhen standing in SignInPage'
      '\nThen every Widget renders correctly',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<AuthBloc>.value(
                value: mockAuthBloc,
                child: SignInPage(),
              ),
            ),
          ),
        );

        final title = find.widgetWithText(AppBar, 'Sign In');
        final logo = find.byIcon(Icons.format_quote);
        final emailField = find.widgetWithText(TextFormField, 'Email');
        final passwordField = find.widgetWithText(TextFormField, 'Password');
        final signInButton = find.widgetWithText(TextButton, 'SIGN IN');
        final registerButton = find.widgetWithText(TextButton, 'REGISTER');
        final signInWithGoogleButton = find.widgetWithText(
          ElevatedButton,
          'SIGN IN WITH GOOGLE',
        );
        expect(title, findsOneWidget);
        expect(logo, findsOneWidget);
        expect(emailField, findsOneWidget);
        expect(passwordField, findsOneWidget);
        expect(signInButton, findsOneWidget);
        expect(registerButton, findsOneWidget);
        expect(signInWithGoogleButton, findsOneWidget);
      },
    );
  });
}
