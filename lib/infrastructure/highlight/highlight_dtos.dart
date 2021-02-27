import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/infrastructure/highlight/server_timestamp_converter.dart';

part 'highlight_dtos.freezed.dart';
part 'highlight_dtos.g.dart';

/// DTO for Highlight entity.
///
/// [id] parameter is not stored in database along all the other
/// data. That's because [id] is the *document identifier* and not
/// part of the object itself. So, is not annotated as `@required`
/// and also is ignored from `fromJson()` factory method.
///
/// [serverTimestamp] is a [FieldValue]. This is a _sentinel value_,
/// that is, serves as a placeholder to be replaced in server (Firestore)
/// with the actual time of that server.
@freezed
abstract class HighlightDto implements _$HighlightDto {
  const HighlightDto._();

  const factory HighlightDto({
    @JsonKey(ignore: true) String id,
    @required String quote,
    @required int color,
    @required String imageUrl,
    @required String bookTitle,
    @required int pageNumber,
    @required @ServerTimestampConverter() FieldValue serverTimestamp,
  }) = _HighlightDto;

  factory HighlightDto.fromDomain(Highlight highlight) {
    return HighlightDto(
      id: highlight.id.getOrCrash(),
      quote: highlight.quote.getOrCrash(),
      color: highlight.color.getOrCrash().value,
      imageUrl: highlight.imageUrl.getOrCrash(),
      bookTitle: highlight.bookTitle.getOrCrash(),
      pageNumber: highlight.pageNumber.getOrCrash(),
      serverTimestamp: FieldValue.serverTimestamp(),
    );
  }

  Highlight toDomain() {
    return Highlight(
      id: UniqueId.fromUniqueString(id),
      quote: HighlightQuote(quote),
      color: HighlightColor(Color(color)),
      imageUrl: imageUrl.isEmpty ? ImageUrl.notAvailable() : ImageUrl(imageUrl),
      bookTitle: BookTitle(bookTitle),
      pageNumber: QuotePage(pageNumber),
    );
  }

  factory HighlightDto.fromJson(Map<String, dynamic> json) =>
      _$HighlightDtoFromJson(json);

  /// Create DTO from Firestore getting the ID from document.
  ///
  /// This method is specific to Firestore to not depend completely on this
  /// data source.
  factory HighlightDto.fromFirestore(DocumentSnapshot document) {
    return HighlightDto.fromJson(document.data()).copyWith(id: document.id);
  }
}
