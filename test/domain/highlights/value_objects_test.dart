import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' hide decodeImageFromList;

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

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
      '\nGiven a quote larger than 1000 characters'
      '\nWhen it is inputed'
      '\nThen return Left with ExceedingLength failure holding the same input',
      () async {
        final largeQuote = 'a' * 1001;
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
      '\nGiven a title larger than 50 characters'
      '\nWhen it is inputed'
      '\nThen return Left with ExceedingLength failure holding the same input',
      () async {
        final largeTitle = 'a' * 51;
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
  group('QuotePage', () {
    test(
      '\nGiven a valid page number'
      '\nWhen it is inputed'
      '\nThen return Right with the same input',
      () async {
        const validPage = 665;
        final pageValueObject = QuotePage(validPage).value;

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
        const largePage = 1234567;
        final pageValueObject = QuotePage(largePage).value;

        expect(pageValueObject.isLeft(), isTrue);
        pageValueObject.fold(
          (failure) {
            expect(failure, isA<ExceedingLength<int>>());
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
        const negativePage = -10;
        final pageValueObject = QuotePage(negativePage).value;

        expect(pageValueObject.isLeft(), isTrue);
        pageValueObject.fold(
          (failure) {
            expect(failure, isA<NegativeNumber<int>>());
            expect(failure.failedValue, negativePage);
          },
          (_) {},
        );
      },
    );
  });
  group('HighlightImageFile', () {
    test(
      '\nGiven a valid Image'
      '\nWhen it is inputed'
      '\nThen return Right with some() holding the same input)',
      () async {
        final file = File('test/fixtures/sample_image.png');
        final Uint8List fileAsBytes = await file.readAsBytes();
        final validImage = await decodeImageFromList(fileAsBytes);
        final fileValueObject = HighlightImage(validImage).value;

        expect(fileValueObject.isRight(), isTrue);
        fileValueObject.fold(
          (_) {},
          (value) {
            expect(value, some(validImage));
          },
        );
      },
    );
    test(
      '\nGiven no Image'
      '\nWhen HighlightImage is created'
      '\nThen return Right with none()',
      () async {
        final fileValueObject = HighlightImage().value;

        expect(fileValueObject.isRight(), isTrue);
        fileValueObject.fold(
          (_) {},
          (value) {
            expect(value, none());
          },
        );
      },
    );
  });
}
