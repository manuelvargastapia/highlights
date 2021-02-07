import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/core/failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  /// Get only failure independently of type.
  ///
  /// This helper is used by entities when failure is needed but
  /// its concrete type doesn't matter
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (_) => right(unit));
  }

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

/// Context-independent IDs for entities.
///
/// This ValueObject generates unique IDs for any entity. It provides
/// a default factory constructor and a named one. `UniqueId()`
/// generates a unique ID with `Uuid().v1()` from _uuid_ package.
/// `UniqueId.fromUniqueString(String uniqueId)` takes an external
/// unique ID. Only `UniqueId()` guarantees uniqueness.
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(right(Uuid().v1()));
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(right(uniqueId));
  }

  const UniqueId._(this.value);
}
