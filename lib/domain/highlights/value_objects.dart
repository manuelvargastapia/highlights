import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/core/value_transformers.dart';
import 'package:highlights/domain/core/value_validators.dart';

class HighlightQuote extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

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

  // TODO: consider a better approach (local BD, for ex)
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
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

  static const maxLength = 50;

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

class QuotePage extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 6;

  factory QuotePage(String input) {
    assert(input != null);
    return QuotePage._(
      validateMaxLength(input, maxLength)
          .flatMap(validateNotEmpty)
          .flatMap(validateIsInt)
          .flatMap(validateIsPositive),
    );
  }

  const QuotePage._(this.value);
}

class ImageUrl extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ImageUrl(String input) {
    assert(input != null);

    return ImageUrl._(validateUrl(input));
  }

  /// Allow creating a non-available ImageUrl by using a (valid) empty String.
  factory ImageUrl.notAvailable() {
    return ImageUrl._(right(''));
  }

  const ImageUrl._(this.value);
}
