import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'quote_info.freezed.dart';

/// Data class representing information about quote in Highlight entity.
///
/// [_$QuoteInfo] is being implemented instead of being used as a mixin.
/// This allow us to implement a custom `failureOption` getter to validate
/// all the entity at once. Also, a `failureOrUnit` has been added to
/// [ValueObject] as a helper to get only failures bypassing type checking.
/// The relevant use case that justifies this addition is when we need to
/// validate and give UI feedback for all the entity, for example, when the UI
/// is not currently showing detailed information about the entity. While user
/// is, for example, editing a Highlight, we can show her specific failures
/// using the Value Objects validations.
@freezed
abstract class QuoteInfo implements _$QuoteInfo {
  const QuoteInfo._();

  const factory QuoteInfo({
    @required UniqueId id,
    @required BookTitle bookTitle,
    @required QuotePage pageNumber,
  }) = _QuoteInfo;

  factory QuoteInfo.empty() => QuoteInfo(
        id: UniqueId(),
        bookTitle: BookTitle(''),
        pageNumber: QuotePage(0),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return bookTitle.failureOrUnit
        .andThen(pageNumber.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
