import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'image.freezed.dart';

@freezed
abstract class Image implements _$Image {
  const factory Image({
    @required Option<ImageUrl> imageUrl,
    @required Option<ImageFile> imageFile,
  }) = _Image;

  const Image._();

  Option<ValueFailure<dynamic>> get failureOption {
    return imageUrl.fold(
      () => none(),
      (i) => i.failureOrUnit.fold(
        (f) => some(f),
        (_) => none(),
      ),
    );
  }

  bool get isUploaded => imageUrl.fold(
        () => false,
        (imageUrl) => imageUrl.isValid(),
      );
}
