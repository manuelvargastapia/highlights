import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/core/value_transformers.dart';
import 'package:highlights/domain/core/value_validators.dart';

class HighlightQuote extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 3000;

  factory HighlightQuote(String input) {
    assert(input != null);
    return HighlightQuote._(
      validateMaxLength(input, maxLength).flatMap(validateNotEmpty),
    );
  }

  const HighlightQuote._(this.value);
}

class HighlightColor extends ValueObject<Color> {
  @override
  final Either<ValueFailure<Color>, Color> value;

  static const List<Color> predefinedColors = [
    Color(0xffffe08e), // yellow
    Color(0xffffcbc1), // peach
    Color(0xfffca3b7), // flamingo
    Color(0xffd0f0c0), // tea
    Color(0xffd5baf8), // purple
    Color(0xff89cff0), // blue
    Color(0xffe6c69b), // beige
  ];

  factory HighlightColor(Color input) {
    assert(input != null);
    return HighlightColor._(right(makeColorOpaque(input)));
  }

  const HighlightColor._(this.value);
}

class BookTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 200;

  factory BookTitle(String input) {
    assert(input != null);
    return BookTitle._(
      validateMaxLength(input, maxLength)
          .flatMap(validateNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const BookTitle._(this.value);
}

class PageNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 6;

  factory PageNumber(String input) {
    assert(input != null);
    return PageNumber._(
      validateMaxLength(input, maxLength)
          .flatMap(validateNotEmpty)
          .flatMap(validateIsInt)
          .flatMap(validateIsPositive),
    );
  }

  const PageNumber._(this.value);
}

class ImageUrl extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ImageUrl(String input) {
    assert(input != null);

    return ImageUrl._(validateUrl(input));
  }

  const ImageUrl._(this.value);
}

class ImageFile extends ValueObject<File> {
  @override
  final Either<ValueFailure<File>, File> value;

  factory ImageFile(File input) {
    assert(input != null);

    return ImageFile._(right(input));
  }

  const ImageFile._(this.value);
}
