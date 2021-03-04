// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HighlightDto _$_$_HighlightDtoFromJson(Map<String, dynamic> json) {
  return _$_HighlightDto(
    quote: json['quote'] as String,
    color: json['color'] as int,
    image: const ImageDtoConverter()
        .fromJson(json['image'] as Map<String, dynamic>),
    bookTitle: json['bookTitle'] as String,
    pageNumber: json['pageNumber'] as String,
    serverTimestamp:
        const ServerTimestampConverter().fromJson(json['serverTimestamp']),
  );
}

Map<String, dynamic> _$_$_HighlightDtoToJson(_$_HighlightDto instance) =>
    <String, dynamic>{
      'quote': instance.quote,
      'color': instance.color,
      'image': const ImageDtoConverter().toJson(instance.image),
      'bookTitle': instance.bookTitle,
      'pageNumber': instance.pageNumber,
      'serverTimestamp':
          const ServerTimestampConverter().toJson(instance.serverTimestamp),
    };
