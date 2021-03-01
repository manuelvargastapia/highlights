import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import 'package:highlights/domain/highlights/highlight_search_filter.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/image.dart';

abstract class IHighlightRepository {
  Stream<Either<HighlightFailure, KtList<Highlight>>> watchAll();
  Stream<Either<HighlightFailure, KtList<Highlight>>> watchFiltered(
    HighlightSearchFilter filter,
  );
  Future<Either<HighlightFailure, Unit>> create(Highlight highlight);
  Future<Either<HighlightFailure, Unit>> update(Highlight highlight);
  Future<Either<HighlightFailure, Unit>> delete(Highlight highlight);
  Future<Either<HighlightFailure, Image>> uploadImage(Image image);
}
