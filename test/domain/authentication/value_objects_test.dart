import 'package:flutter_test/flutter_test.dart';

import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/domain/core/failures.dart';

void main() {
  group("Authentication Value Objects", () {
    test(
      '\nGiven a valid email address\nWhen it is inputed\nThen return Right with the same input',
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
      '\nGiven a list of invalid email addresses\nWhen they are inputed\nThen return Left with an InvalidEmail',
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
      '\nGiven a valid password\nWhen it is inputed\nThen return Right with the same input',
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
      '\nGiven an invalid password\nWhen it is inputed\nThen return Left with an InvalidPassword',
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
