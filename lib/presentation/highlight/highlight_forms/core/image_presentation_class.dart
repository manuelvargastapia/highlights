import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';

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
        imageUrl: image.imageUrl.fold(
          () => '',
          (imageUrl) => imageUrl.getOrCrash(),
        ),
        imageFile: image.imageFile.fold(
          () => File(''),
          (imageFile) => imageFile.getOrCrash(),
        ),
      );
}

extension ImagePrimitiveX on ImagePrimitive {
  Image toDomain() => Image(
        imageUrl: imageUrl.isEmpty ? none() : some(ImageUrl(imageUrl)),
        imageFile: imageFile.path.isEmpty ? none() : some(ImageFile(imageFile)),
      );
}
