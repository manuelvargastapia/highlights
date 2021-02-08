import 'package:dartz/dartz.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';
import 'package:kt_dart/collection.dart';

import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';

abstract class IHighlightRepository {
  Stream<Either<HighlightFailure, KtList<Highlight>>> watchAll();
  Stream<Either<HighlightFailure, KtList<Highlight>>> watchFiltered(
    HighlighSearchFilter filter,
  );
  Future<Either<HighlightFailure, Unit>> create(Highlight highlight);
  Future<Either<HighlightFailure, Unit>> update(Highlight highlight);
  Future<Either<HighlightFailure, Unit>> delete(Highlight highlight);
}
