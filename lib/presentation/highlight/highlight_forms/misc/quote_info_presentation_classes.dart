import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/quote_info.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'quote_info_presentation_classes.freezed.dart';

/// QuoteInfo class for Presentation layer.
///
/// It's similar to QuoteInfoDto, but adapted to presentation layer so
/// it can be created using primitive values only and also specifying
/// a [UniqueId] just when created.
///
/// This class should be used in presentation layer overall, such as
/// passing them as argument for BLoC events, for example.
@freezed
abstract class QuoteInfoPrimitive implements _$QuoteInfoPrimitive {
  const QuoteInfoPrimitive._();

  const factory QuoteInfoPrimitive({
    @required UniqueId id,
    @required String bookTitle,
    @required int pageNumber,
  }) = _QuoteInfoPrimitive;

  factory QuoteInfoPrimitive.empty() => QuoteInfoPrimitive(
        id: UniqueId(),
        bookTitle: '',
        pageNumber: 0,
      );

  factory QuoteInfoPrimitive.fromDomain(QuoteInfo quote) {
    return QuoteInfoPrimitive(
      id: quote.id,
      bookTitle: quote.bookTitle.getOrCrash(),
      pageNumber: quote.pageNumber.getOrCrash(),
    );
  }

  QuoteInfo toDomain() {
    return QuoteInfo(
      id: id,
      bookTitle: BookTitle(bookTitle),
      pageNumber: QuotePage(pageNumber),
    );
  }
}
