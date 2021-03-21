import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/infrastructure/authentication/auth_provider_manager.dart';
import 'package:highlights/domain/authentication/user.dart';
import 'package:highlights/infrastructure/authentication/firebase_user_mapper.dart';

/// IAuthFacade implementation class for handling [FirebaseAuth] and
/// [GoogleSignIn] authentication methods
///
/// It needs to be annotated in behalf of IAuthFacade to be registered
/// as dependency, as its concrete implementation
@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// Allow access to `OAuthCredential`s for Google Sign In
  ///
  /// The original purpose of this dependency was to make it possible
  /// to write unit testing that includes static method calls. Concretely,
  /// `GoogleAuthProvider.credential()` couldn't be mocked, so test couldn't
  /// be passed. Because of this, the parameter is optional. This way,
  /// it's only required for testing purposes
  final AuthProviderManager _authProviderManager;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn, [
    this._authProviderManager = const AuthProviderManager(),
  ]);

  /// Get currently signed in User.
  ///
  /// This method returns an `Option` holding a [User] from domain layer.
  /// The class [FirebaseUserUserDomainX] provides the [toDomainUser] method
  /// to create a domain User from FirebaseAuth User. In case the latter
  /// is `null` [getSignedInUser] return an `Option` holding `None`.
  @override
  Option<User> getSignedInUser() =>
      optionOf(_firebaseAuth.currentUser?.toDomainUser());

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressString = emailAddress.getOrCrash();
    final passwordString = password.getOrCrash();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == 'operation-not-allowed') {
        return left(const AuthFailure.operationNotAllowed());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressString = emailAddress.getOrCrash();
    final passwordString = password.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = _authProviderManager.getGoogleOAuthCredential(
        googleAuthentication,
      );

      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((_) => right(unit));
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    } on PlatformException catch (e) {
      // Only this method trows an specific exception related to network
      // connection. Sign in and Register only show a generic internal error
      if (e.code.contains('network_error')) {
        return left(const AuthFailure.networkConnectionFailed());
      }
      return left(const AuthFailure.serverError());
    }
  }

  // TODO: test
  @override
  Future<Either<AuthFailure, Unit>> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code.contains('too-many-requests')) {
        return left(const AuthFailure.tooManyRequests());
      }
      return left(const AuthFailure.serverError());
    }
  }

  // TODO: test
  @override
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail({
    @required EmailAddress emailAddress,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: emailAddress.getOrCrash(),
      );
      return right(unit);
    } on FirebaseAuthException catch (_) {
      // TODO: check for specific errors if exist
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);
}
