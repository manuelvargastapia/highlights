import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'image_presentation_class.freezed.dart';

@freezed
abstract class ImagePrimitive with _$ImagePrimitive {
  const factory ImagePrimitive({
    @required String imageUrl,
    @required File imageFile,
  }) = _ImagePrimitive;

  factory ImagePrimitive.empty() => ImagePrimitive(
        imageUrl: '',
        imageFile: File(''),
      );

  factory ImagePrimitive.fromFile(File file) => ImagePrimitive(
        imageUrl: '',
        imageFile: file,
      );

  factory ImagePrimitive.fromDomain(Image image) => ImagePrimitive(
        imageUrl: image.imageUrl.getOrCrash(),
        imageFile: image.imageFile.getOrCrash(),
      );
}

extension ImagePrimitiveX on ImagePrimitive {
  Image toDomain() => Image(
        imageUrl: ImageUrl(imageUrl),
        imageFile: ImageFile(imageFile),
      );
}
