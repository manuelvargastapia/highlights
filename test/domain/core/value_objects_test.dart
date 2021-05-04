import 'package:flutter_test/flutter_test.dart';

import 'package:highlights/domain/core/value_objects.dart';

void main() {
  group('UniqueId', () {
    test(
      '\nGiven direct instantiation'
      '\nWhen UniqueId() is called'
      '\nThen return Right with a time-based uid (v1)',
      () async {
        final uniqueIdValueObject = UniqueId().value;

        expect(uniqueIdValueObject.isRight(), isTrue);
        uniqueIdValueObject.fold(
          (_) {},
          (value) {
            expect(
              // test match this format: 6c84fb90-12c4-11e1-840d-7b25c5ee775a
              RegExp(
                r'[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}',
              ).hasMatch(value),
              isTrue,
            );
          },
        );
      },
    );

    test(
      '\nGiven instantiation by named constructor'
      '\nWhen UniqueId.fromUniqueString() is called'
      '\nThen return Right with a UniqueId hoding the same input',
      () async {
        const uniqueString = 'unique-string';

        final uniqueIdValueObject =
            UniqueId.fromUniqueString(uniqueString).value;

        expect(uniqueIdValueObject.isRight(), isTrue);
        uniqueIdValueObject.fold(
          (_) {},
          (value) {
            expect(value, uniqueString);
          },
        );
      },
    );
  });
}
