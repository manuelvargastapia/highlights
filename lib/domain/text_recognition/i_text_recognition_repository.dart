import 'dart:ui';

import 'package:dartz/dartz.dart';

import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/text_recognition/text_recognition_failure.dart';
import 'package:highlights/domain/text_recognition/text_recognition_result.dart';
import 'package:highlights/domain/text_recognition/value_objects.dart';

abstract class ITextRecognitionRepository {
  Future<Either<TextRecognitionFailure, TextRecognitionResult>>
      extratTextFromImage(Image image);
  Future<Either<TextRecognitionFailure, ImageSize>> getImageSize(
    Image image,
  );
}
