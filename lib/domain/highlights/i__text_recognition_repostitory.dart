import 'package:dartz/dartz.dart';

import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/highlights/quote.dart';

abstract class ITextRecognitionRepository {
  Future<Either<HighlightFailure, Quote>> processImage(Image image);
}
