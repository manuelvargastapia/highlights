import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';

extension StorageX on FirebaseStorage {
  Future<Either<HighlightFailure, String>> uploadImage(
    Highlight highlight,
    DocumentReference userDocument,
  ) async {
    try {
      final image = highlight.image.getOrElse(() => throw NotImageProvided());
      final userId = userDocument.id;
      final highlightId = highlight.id.getOrCrash();
      final path = '$userId/$highlightId';
      final storageReference = ref().child(path);
      await storageReference.putFile(
        image.imageFile.getOrElse(() => throw NotImageProvided()).getOrCrash(),
      );
      final downloadUrl = await storageReference.getDownloadURL();
      return right(downloadUrl);
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        return left(const HighlightFailure.insufficientPermission());
      } else {
        return left(const HighlightFailure.unexpected());
      }
    }
  }
}
