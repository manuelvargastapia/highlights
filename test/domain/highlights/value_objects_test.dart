import 'dart:io';
import 'dart:ui' hide decodeImageFromList;

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

void main() {
  // Required to use PaintingBinding with decodeImageFromList()
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HighlightQuote', () {
    test(
      '\nGiven a valid quote'
      '\nWhen it is inputed'
      '\nThen return Right with the same input',
      () async {
        const validQuote = 'This is a valid quote';
        final quoteValueObject = HighlightQuote(validQuote).value;

        expect(quoteValueObject.isRight(), isTrue);
        quoteValueObject.fold(
          (_) {},
          (value) {
            expect(value, validQuote);
          },
        );
      },
    );
    test(
      '\nGiven an empty quote'
      '\nWhen it is inputed'
      '\nThen return Left with an Empty failure',
      () async {
        const emptyQuote = '';
        final quoteValueObject = HighlightQuote(emptyQuote).value;

        expect(quoteValueObject.isLeft(), isTrue);
        quoteValueObject.fold(
          (failure) {
            expect(failure, isA<Empty<String>>());
          },
          (_) {},
        );
      },
    );
    test(
      '\nGiven a quote larger than 3000 characters'
      '\nWhen it is inputed'
      '\nThen return Left with ExceedingLength failure holding the same input',
      () async {
        final largeQuote = 'a' * 3001;
        final quoteValueObject = HighlightQuote(largeQuote).value;

        expect(quoteValueObject.isLeft(), isTrue);
        quoteValueObject.fold(
          (failure) {
            expect(failure, isA<ExceedingLength<String>>());
            expect(failure.failedValue, largeQuote);
          },
          (_) {},
        );
      },
    );
  });
  group('HighlightColor', () {
    test(
      '\nGiven a color from HighlightColor.predefinedColors'
      '\nWhen it is inputed'
      '\nThen return Right with the same input',
      () async {
        for (final color in HighlightColor.predefinedColors) {
          final colorValueObject = HighlightColor(color).value;
          expect(colorValueObject.isRight(), isTrue);
          colorValueObject.fold(
            (_) {},
            (value) {
              expect(value, color);
            },
          );
        }
      },
    );
    test(
      '\nGiven a color provided for user'
      '\nWhen it is inputed'
      '\nThen return Right with an opaque version of the same color',
      () async {
        const color = Color(0x36fafafa);
        final colorValueObject = HighlightColor(color).value;

        expect(colorValueObject.isRight(), isTrue);
        colorValueObject.fold(
          (_) {},
          (value) {
            expect(value, color.withOpacity(1));
          },
        );
      },
    );
  });
  group('BookTitle', () {
    test(
      '\nGiven a valid title'
      '\nWhen it is inputed'
      '\nThen return Right with the same input',
      () async {
        const validTitle = 'This is a valid title';
        final titleValueObject = BookTitle(validTitle).value;

        expect(titleValueObject.isRight(), isTrue);
        titleValueObject.fold(
          (_) {},
          (value) {
            expect(value, validTitle);
          },
        );
      },
    );
    test(
      '\nGiven an empty title'
      '\nWhen it is inputed'
      '\nThen return Left with an Empty failure',
      () async {
        const emptyTitle = '';
        final titleValueObject = BookTitle(emptyTitle).value;

        expect(titleValueObject.isLeft(), isTrue);
        titleValueObject.fold(
          (failure) {
            expect(failure, isA<Empty<String>>());
          },
          (_) {},
        );
      },
    );
    test(
      '\nGiven a title larger than 200 characters'
      '\nWhen it is inputed'
      '\nThen return Left with ExceedingLength failure holding the same input',
      () async {
        final largeTitle = 'a' * 201;
        final titleValueObject = BookTitle(largeTitle).value;

        expect(titleValueObject.isLeft(), isTrue);
        titleValueObject.fold(
          (failure) {
            expect(failure, isA<ExceedingLength<String>>());
            expect(failure.failedValue, largeTitle);
          },
          (_) {},
        );
      },
    );
    test(
      '\nGiven a multiline title'
      '\nWhen it is inputed'
      '\nThen return Left with Multiline failure holding the same input',
      () async {
        const multilineTitle = 'This is a \n multiline title';
        final titleValueObject = BookTitle(multilineTitle).value;

        expect(titleValueObject.isLeft(), isTrue);
        titleValueObject.fold(
          (failure) {
            expect(failure, isA<Multiline<String>>());
            expect(failure.failedValue, multilineTitle);
          },
          (_) {},
        );
      },
    );
  });
  group('PageNumber', () {
    test(
      '\nGiven a valid page number'
      '\nWhen it is inputed'
      '\nThen return Right with the same input',
      () async {
        const validPage = '665';
        final pageValueObject = PageNumber(validPage).value;

        expect(pageValueObject.isRight(), isTrue);
        pageValueObject.fold(
          (_) {},
          (value) {
            expect(value, validPage);
          },
        );
      },
    );
    test(
      '\nGiven a page larger than 6 characters'
      '\nWhen it is inputed'
      '\nThen return Left with ExceedingLength failure holding the same input',
      () async {
        const largePage = '1234567';
        final pageValueObject = PageNumber(largePage).value;

        expect(pageValueObject.isLeft(), isTrue);
        pageValueObject.fold(
          (failure) {
            expect(failure, isA<ExceedingLength<String>>());
            expect(failure.failedValue, largePage);
          },
          (_) {},
        );
      },
    );
    test(
      '\nGiven a negative page number'
      '\nWhen it is inputed'
      '\nThen return Left with NegativeNumber failure holding the same input',
      () async {
        const negativePage = '-10';
        final pageValueObject = PageNumber(negativePage).value;

        expect(pageValueObject.isLeft(), isTrue);
        pageValueObject.fold(
          (failure) {
            expect(failure, isA<NegativeNumber<String>>());
            expect(failure.failedValue, negativePage);
          },
          (_) {},
        );
      },
    );

    test(
      '\nGiven an empty page number'
      '\nWhen it is inputed'
      '\nThen return Left with an Empty failure',
      () async {
        const emptyPage = '';
        final pageValueObject = PageNumber(emptyPage).value;

        expect(pageValueObject.isLeft(), isTrue);
        pageValueObject.fold(
          (failure) {
            expect(failure, isA<Empty<String>>());
          },
          (_) {},
        );
      },
    );

    test(
      '\nGiven a non-int String'
      '\nWhen it is inputed'
      '\nThen return Left with an NotAnInt failure',
      () async {
        const notInt = 'nine';
        final pageValueObject = PageNumber(notInt).value;

        expect(pageValueObject.isLeft(), isTrue);
        pageValueObject.fold(
          (failure) {
            expect(failure, isA<NotAnInt<String>>());
          },
          (_) {},
        );
      },
    );
  });
  group('ImageUrl', () {
    test(
      '\nGiven a valid URL'
      '\nWhen it is inputed'
      '\nThen return Right with the same input',
      () async {
        const validUrls = [
          'test.com',
          'www.test.com',
          'http://test.com',
          'https://test.com',
          'http://www.test.com',
          'https://www.test.com',
        ];
        void matcher(int index, String url) {
          final imageUrlValueObject = ImageUrl(url).value;

          expect(imageUrlValueObject.isRight(), isTrue);
          imageUrlValueObject.fold(
            (_) {},
            (value) {
              expect(value, validUrls[index]);
            },
          );
        }

        validUrls.asMap().forEach(matcher);
      },
    );

    test(
      '\nGiven a list of invalid URLs'
      '\nWhen they are inputed'
      '\nThen return Left with an InvalidUrl',
      () async {
        const invalidUrls = [
          '',
          'http:',
          'fake/url',
          'fake',
        ];
        void matcher(String address) {
          final imageUrlValueObject = ImageUrl(address).value;

          expect(imageUrlValueObject.isLeft(), isTrue);
          imageUrlValueObject.fold(
            (failure) {
              expect(failure, isA<InvalidUrl>());
            },
            (_) {},
          );
        }

        invalidUrls.forEach(matcher);
      },
    );
  });
  group('ImageFile', () {
    test(
      '\nGiven any File'
      '\nWhen it is inputed'
      '\nThen return Right with the same input',
      () async {
        final files = [
          File('path-to-file'),
          File('path/to/file'),
          File(''),
        ];

        void matcher(int index, File file) {
          final imageFileValueObject = ImageFile(file).value;

          expect(imageFileValueObject.isRight(), isTrue);
          imageFileValueObject.fold(
            (_) {},
            (file) {
              expect(file, files[index]);
            },
          );
        }

        files.asMap().forEach(matcher);
      },
    );
  });
}
