import 'package:flutter_test/flutter_test.dart';

import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/domain/core/failures.dart';

void main() {
  group("Authentication Value Objects", () {
    test(
      'Given a valid email address When it is inputed Then return Right with the same input',
      () async {
        const validEmailAddress = "test@test.test";
        final emailAddressValueObject = EmailAddress(validEmailAddress).value;

        expect(emailAddressValueObject.isRight(), isTrue);
        emailAddressValueObject.fold(
          (_) {},
          (value) {
            expect(value, validEmailAddress);
          },
        );
      },
    );
    test(
      'Given a list of invalid email addresses When they are inputed Then return Left with an InvalidEmail',
      () async {
        const invalidEmailAddresses = [
          "testtest.test",
          "test@",
          "test.test",
          "test.test.test",
          "test@.test",
          "@test",
          "test",
          "",
        ];
        void matcher(String address) {
          final emailAddressValueObject = EmailAddress(address).value;
          expect(emailAddressValueObject.isLeft(), isTrue);
          emailAddressValueObject.fold(
            (failure) {
              expect(failure, isA<InvalidEmail>());
            },
            (_) {},
          );
        }

        invalidEmailAddresses.forEach(matcher);
      },
    );
    test(
      'Given a valid password When it is inputed Then return Right with the same input',
      () async {
        const validPassword = "123456";
        final passwordValueObject = Password(validPassword).value;

        expect(passwordValueObject.isRight(), isTrue);
        passwordValueObject.fold(
          (_) {},
          (value) {
            expect(value, validPassword);
          },
        );
      },
    );
    test(
      'Given an invalid password When it is inputed Then return Left with an InvalidPassword',
      () async {
        const invalidPassword = "123";
        final passwordValueObject = Password(invalidPassword).value;

        expect(passwordValueObject.isLeft(), isTrue);
        passwordValueObject.fold(
          (failure) {
            expect(failure, isA<ShortPassword>());
          },
          (_) {},
        );
      },
    );
  });
}
