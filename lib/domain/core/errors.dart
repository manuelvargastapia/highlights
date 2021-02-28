import 'package:highlights/domain/core/failures.dart';

// TODO: log any relevant unexpected error instance

/// Class to define unexpected errors coming from value objects operations.
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}

/// Class to define unexpected errors coming from Firebase users checking.
class NotAuthenticatedError extends Error {}
