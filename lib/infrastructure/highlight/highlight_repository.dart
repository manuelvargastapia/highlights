import 'package:flutter/services.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/infrastructure/highlight/highlight_dtos.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/i_highlight_repository.dart';
import 'package:highlights/infrastructure/core/firestore_helpers.dart';

@LazySingleton(as: IHighlightRepository)
class HighlightRepository implements IHighlightRepository {
  final FirebaseFirestore _firestore;
  final IAuthFacade _authFacade;

  HighlightRepository(this._firestore, this._authFacade);

  @override
  Stream<Either<HighlightFailure, KtList<Highlight>>> watchAll() async* {
    final userDocument = await _firestore.userDocument(_authFacade);
    yield* userDocument.highlightCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<HighlightFailure, KtList<Highlight>>(
            snapshot.docs
                .map((doc) => HighlightDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      // Extension method from RxDart library to handle errors in Streams
      // TODO: consider replacing it with native error handling to remove rxdart
      // as is being used only here
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        // TODO: test
        return left(const HighlightFailure.insufficientPermission());
      } else {
        // TODO: log e
        return left(const HighlightFailure.unexpected());
      }
    });
  }

  // TODO: implement Algolia or Elasticsearch for better UX
  @override
  Stream<Either<HighlightFailure, KtList<Highlight>>> watchFiltered(
    HighlightSearchFilter filter,
  ) async* {
    final userDocument = await _firestore.userDocument(_authFacade);

    final collecitonRef = userDocument.highlightCollection;

    Query query = collecitonRef.orderBy('serverTimestamp', descending: true);

    if (filter.showOnlyIfHasImage) {
      query = collecitonRef.where('imageUrl', isNotEqualTo: '');
    }

    yield* query
        .snapshots()
        .map(
          (snapshot) => right<HighlightFailure, KtList<Highlight>>(
            snapshot.docs
                .map((doc) => HighlightDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        // TODO: test
        return left(const HighlightFailure.insufficientPermission());
      } else {
        // TODO: log e
        return left(const HighlightFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<HighlightFailure, Unit>> create(Highlight highlight) async {
    try {
      final userDocument = await _firestore.userDocument(_authFacade);
      final highlightDto = HighlightDto.fromDomain(highlight);
      await userDocument.highlightCollection
          .doc(highlightDto.id)
          .set(highlightDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        // TODO: test
        return left(const HighlightFailure.insufficientPermission());
      } else {
        // TODO: test
        return left(const HighlightFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<HighlightFailure, Unit>> update(Highlight highlight) async {
    try {
      final userDocument = await _firestore.userDocument(_authFacade);
      final highlightDto = HighlightDto.fromDomain(highlight);
      await userDocument.highlightCollection
          .doc(highlightDto.id)
          .update(highlightDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        // TODO: test
        return left(const HighlightFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const HighlightFailure.unableToUpdate());
      } else {
        // TODO: test
        return left(const HighlightFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<HighlightFailure, Unit>> delete(Highlight highlight) async {
    try {
      final userDocument = await _firestore.userDocument(_authFacade);
      final highlightId = highlight.id.getOrCrash();
      await userDocument.highlightCollection.doc(highlightId).delete();
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        // TODO: test
        return left(const HighlightFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const HighlightFailure.unableToUpdate());
      } else {
        return left(const HighlightFailure.unexpected());
      }
    }
  }
}
