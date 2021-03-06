import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:highlights/domain/core/value_transformers.dart';
import 'package:kt_dart/collection.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/core/value_validators.dart';

class RecognizedText extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory RecognizedText(String input) {
    assert(input != null);
    return RecognizedText._(
      validateMaxLength(input, maxLength).fold(
        (failure) => right(trimToMaxLength(input, maxLength)),
        validateNotEmpty,
      ),
    );
  }

  const RecognizedText._(this.value);
}

class RecognizedTextElement extends ValueObject<TextElement> {
  @override
  final Either<ValueFailure<TextElement>, TextElement> value;

  factory RecognizedTextElement(TextElement input) {
    assert(input != null);
    return RecognizedTextElement._(right(input));
  }

  const RecognizedTextElement._(this.value);
}

class ImmutableList<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  factory ImmutableList(KtList<T> input) {
    assert(input != null);
    return ImmutableList._(right(input));
  }

  const ImmutableList._(this.value);
}

class ImageSize extends ValueObject<Size> {
  @override
  final Either<ValueFailure<Size>, Size> value;

  factory ImageSize(Size input) {
    assert(input != null);
    return ImageSize._(right(input));
  }

  const ImageSize._(this.value);
}
