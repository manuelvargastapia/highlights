import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:highlights/infrastructure/highlight/image_dto.dart';

/// Helper class,used by DTOs, to convert from and to Firebase [FieldValue].
class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) => FieldValue.serverTimestamp();

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

class ImageDtoConverter
    implements JsonConverter<ImageDto, Map<String, dynamic>> {
  const ImageDtoConverter();

  @override
  ImageDto fromJson(Map<String, dynamic> json) {
    return ImageDto(
      imageUrl: json['url'].toString(),
      imageFile: json['path'].toString(),
    );
  }

  @override
  Map<String, dynamic> toJson(ImageDto imageDto) {
    return {'url': imageDto.imageUrl, 'path': imageDto.imageFile};
  }
}
