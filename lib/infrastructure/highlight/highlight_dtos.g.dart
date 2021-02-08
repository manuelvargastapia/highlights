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
    info: json['info'] == null
        ? null
        : QuoteInfoDto.fromJson(json['info'] as Map<String, dynamic>),
    serverTimestamp:
        const ServerTimestampConverter().fromJson(json['serverTimestamp']),
  );
}

Map<String, dynamic> _$_$_HighlightDtoToJson(_$_HighlightDto instance) =>
    <String, dynamic>{
      'quote': instance.quote,
      'color': instance.color,
      'imageUrl': instance.imageUrl,
      'info': instance.info,
      'serverTimestamp':
          const ServerTimestampConverter().toJson(instance.serverTimestamp),
    };

_$_QuoteInfoDto _$_$_QuoteInfoDtoFromJson(Map<String, dynamic> json) {
  return _$_QuoteInfoDto(
    id: json['id'] as String,
    bookTitle: json['bookTitle'] as String,
    pageNumber: json['pageNumber'] as int,
  );
}

Map<String, dynamic> _$_$_QuoteInfoDtoToJson(_$_QuoteInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookTitle': instance.bookTitle,
      'pageNumber': instance.pageNumber,
    };
