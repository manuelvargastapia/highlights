import 'package:flutter_driver/flutter_driver.dart';

import 'package:test/test.dart';

void main() {
  group('Login', () {
    final emailField = find.byValueKey("email_field");
    final passwordField = find.byValueKey("password_field");
    final signInButton = find.byValueKey("sign_in_button");
    final registerButton = find.byValueKey("register_button");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test(
      "\nGiven unauthenticated user"
      "\nWhen inputting invalid data"
      "\nThen show error messages",
      () async {
        await driver.tap(emailField);
        await driver.enterText("invalid_email");
        await driver.tap(passwordField);
        await driver.enterText("123");

        final emailErrorMessage = find.text("Invalid Email");
        final passwordErrorMessage = find.text("Short Password");

        expect(await driver.getText(emailErrorMessage), "Invalid Email");
        expect(await driver.getText(passwordErrorMessage), "Short Password");
      },
    );

    test(
      "\nGiven unauthenticated user"
      "\nWhen Sign In without data"
      "\nThen show error messages",
      () async {
        final emailErrorMessage = find.text("Invalid Email");
        final passwordErrorMessage = find.text("Short Password");

        await driver.tap(signInButton);

        expect(await driver.getText(emailErrorMessage), "Invalid Email");
        expect(await driver.getText(passwordErrorMessage), "Short Password");
      },
    );

    test(
      "\nGiven unauthenticated user"
      "\nWhen Register without data"
      "\nThen show error messages",
      () async {
        final emailErrorMessage = find.text("Invalid Email");
        final passwordErrorMessage = find.text("Short Password");

        await driver.tap(registerButton);

        expect(await driver.getText(emailErrorMessage), "Invalid Email");
        expect(await driver.getText(passwordErrorMessage), "Short Password");
      },
    );

    // TODO: test Flushbar error messages
  });
}
