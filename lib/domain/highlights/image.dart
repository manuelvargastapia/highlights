import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'image.freezed.dart';

@freezed
abstract class Image implements _$Image {
  const Image._();

  const factory Image({
    @required ImageUrl imageUrl,
    @required ImageFile imageFile,
  }) = _Image;

  factory Image.notAvailable() => Image(
        imageUrl: ImageUrl.notAvailable(),
        imageFile: ImageFile.notAvailable(),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return imageUrl.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
