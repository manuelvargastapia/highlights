import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';

import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/domain/authentication/user.dart';
import 'package:highlights/domain/authentication/value_objects.dart';

/// Interface to simplify use of `FirebaseAuth` and `GoogleSignIn` classes.
///
/// This insterface will be implemented as part of the Infrastructure layer.
abstract class IAuthFacade {
  Option<User> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Either<AuthFailure, Unit>> sendEmailVerification();

  Future<void> signOut();
}
