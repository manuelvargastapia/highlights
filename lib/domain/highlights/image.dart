import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/core/failures.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

part 'image.freezed.dart';

@freezed
abstract class Image implements _$Image {
  const Image._();

  const factory Image({
    @required bool uploaded, // TODO: make it private
    @required Option<ImageUrl> imageUrl,
    @required Option<ImageFile> imageFile,
  }) = _Image;

  Option<ValueFailure<dynamic>> get failureOption {
    return imageUrl.fold(
      () => none(),
      (i) => i.failureOrUnit.fold(
        (f) => some(f),
        (_) => none(),
      ),
    );
  }
}
