import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Generic ValueFailure union type for _Domain_ value objects
///
/// These failures are treated as part of the natural flow of the app.
/// To control unrecoverable errors that implies a crash of the app,
/// see [UnexpectedValueError] class
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}
