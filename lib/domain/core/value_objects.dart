import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/core/failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;
  bool isValid() => value.isRight();

  /// Folds the [ValueObject] to return it or throws [UnexpectedValueError]
  /// containing the [ValueFailure]
  T getOrCrash() {
    return value.fold((failure) => throw UnexpectedValueError(failure), id);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
