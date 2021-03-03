import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'quote.freezed.dart';

@freezed
abstract class Quote implements _$Quote {
  const Quote._();

  const factory Quote({
    @required HighlightQuote highlightQuote,
  }) = _Quote;

  factory Quote.empty() => Quote(
        highlightQuote: HighlightQuote(''),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return highlightQuote.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
