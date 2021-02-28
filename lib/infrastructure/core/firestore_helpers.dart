import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/domain/core/errors.dart';

/// Extension class to access Firebase content easily.
extension FirestoreX on FirebaseFirestore {
  /// Get an user document.
  ///
  /// Fetch the currently signed user and throw an unrecoverable error
  /// if something unexpected ocurrs. This prevent executing the app
  /// when an error at this point of the flow ocurrs.
  ///
  /// [IAuthFacade] is required as parameter to keep it in [HighlightRepository]
  /// as a dependency and thus being able to test the flow properly. Similarly,
  /// the instance of [FirebaseFirestore] that was used to call this method
  /// is used to access `collection()` in `return` to allow the tests use
  /// their mock instances.
  ///
  /// [NotAuthenticatedError] is thrown if an error ocurrs while getting user.
  /// At this point of the flow, the user MUST be authenticated.
  ///
  /// [UnexpectedValueError] is thrown if an error ocurrs while getting
  /// `user.id` value object. This value MUST be present.
  Future<DocumentReference> userDocument(IAuthFacade authFacade) async {
    final userOption = authFacade.getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return collection('users').doc(user.id.getOrCrash());
  }
}

/// Extension class to access 'highlight' collection specifically.
extension DocumentReferenceX on DocumentReference {
  CollectionReference get highlightCollection => collection('highlights');
}
