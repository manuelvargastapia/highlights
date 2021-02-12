import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:highlights/domain/core/failures.dart';

import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/quote_info.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'highlight.freezed.dart';

/// Data class representing information about Highlight entity.
///
/// [_$Highlight] is being implemented instead of being used as a mixin.
/// This allow us to implement a custom `failureOption` getter to validate
/// all the entity at once. Also, a `failureOrUnit` has been added to
/// [ValueObject] as a helper to get only failures bypassing type checking.
/// The relevant use case that justifies this addition is when we need to
/// validate and give UI feedback for all the entity, for example, when the UI
/// is not currently showing detailed information about the entity. While user
/// is, for example, editing a Highlight, we can show her specific failures
/// using the Value Objects validations.
@freezed
abstract class Highlight implements _$Highlight {
  const Highlight._();

  const factory Highlight({
    @required UniqueId id,
    @required HighlightQuote quote,
    @required HighlightColor color,
    @required ImageUrl imageUrl,
    @required QuoteInfo info,
  }) = _Highlights;

  factory Highlight.empty() => Highlight(
        id: UniqueId(),
        quote: HighlightQuote(''),
        color: HighlightColor(HighlightColor.predefinedColors[0]),
        imageUrl: ImageUrl(''),
        info: QuoteInfo.empty(),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return quote.failureOrUnit
        .andThen(info.failureOption.fold(
          // Getting the failureOption from the QuoteInfo ENTITY,
          // NOT a failureOrUnit from a VALUE OBJECT.
          //
          // "right(unit)" simulates the Right of failureOrUnit, while
          // "left(f)" represents the actual failure folded in the
          // next operation
          () => right(unit),
          (f) => left(f),
        ))
        .fold((f) => some(f), (_) => none());
  }
}