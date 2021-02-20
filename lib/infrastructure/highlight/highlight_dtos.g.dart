// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HighlightDto _$_$_HighlightDtoFromJson(Map<String, dynamic> json) {
  return _$_HighlightDto(
    quote: json['quote'] as String,
    color: json['color'] as int,
    imageUrl: json['imageUrl'] as String,
    bookTitle: json['bookTitle'] as String,
    pageNumber: json['pageNumber'] as int,
    serverTimestamp:
        const ServerTimestampConverter().fromJson(json['serverTimestamp']),
  );
}

Map<String, dynamic> _$_$_HighlightDtoToJson(_$_HighlightDto instance) =>
    <String, dynamic>{
      'quote': instance.quote,
      'color': instance.color,
      'imageUrl': instance.imageUrl,
      'bookTitle': instance.bookTitle,
      'pageNumber': instance.pageNumber,
      'serverTimestamp':
          const ServerTimestampConverter().toJson(instance.serverTimestamp),
    };
