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
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.invalidUrl({
    @required T failedValue,
  }) = InvalidUrl<T>;
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.negativeNumber({
    @required T failedValue,
  }) = NegativeNumber<T>;
  const factory ValueFailure.notAnInt({
    @required T failedValue,
  }) = NotAnInt<T>;
}
