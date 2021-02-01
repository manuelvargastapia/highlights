import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/presentation/sign_in/sign_in_page.dart';

import '../../firebase_setup_mock.dart';

void main() {
  configureInjection();
  setupFirestoreMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
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
              body: SignInPage(),
            ),
          ),
        );

        final title = find.widgetWithText(AppBar, 'Sign In');
        final logo = find.byIcon(Icons.format_quote);
        final emailField = find.widgetWithText(TextFormField, 'Email');
        final passwordField = find.widgetWithText(TextFormField, 'Password');
        final signInButton = find.widgetWithText(FlatButton, 'SIGN IN');
        final registerButton = find.widgetWithText(FlatButton, 'REGISTER');
        final signInWithGoogleButton = find.widgetWithText(
          RaisedButton,
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
