import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/injection.dart';

/// Extension class to access Firebase content easily.
extension FirestoreX on FirebaseFirestore {
  /// Get an user document.
  ///
  /// Fetch the currently signed user and throw an unrecoverable error
  /// if something unexpected ocurrs. This prevent executing the app
  /// when an error at this point of the flow ocurrs.
  ///
  /// [NotAuthenticatedError] is thrown if an error ocurrs while getting user.
  /// At this point of the flow, the user MUST be authenticated.
  ///
  /// [UnexpectedValueError] is thrown if an error ocurrs while getting
  /// `user.id` value object. This value MUST be present.
  Future<DocumentReference> userDocument() async {
    final userOption = getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }
}

/// Extension class to access 'highlight' collection specifically.
extension DocumentReferenceX on DocumentReference {
  CollectionReference get highlightCollection => collection('highlights');
}
