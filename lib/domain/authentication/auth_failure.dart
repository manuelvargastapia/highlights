import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// Posible failures that represent the exceptions thrown by [FirebaseAuth]
/// and [GoogleSignIn] methods
@freezed
abstract class AuthFailure with _$AuthFailure {
  /// Represents user abort of [GoogleSignIn.signIn()]
  ///
  /// [GoogleSignIn.signIn()] return `null` when aborted
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  /// Generic internal error used as fallback
  const factory AuthFailure.serverError() = ServerError;

  /// Represents both "user-not-found" and "wrong-password"
  /// [FirebaseAuthException]s
  ///
  /// Using this single failure to represent both exceptions is a security
  /// measure to avoid gibing hints to a user trying to access other users'
  /// accounts
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;

  /// Represents the [FirebaseAuthException] thrown if there already exists
  /// an account with the given email address
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  /// Represents the [FirebaseAuthException] thrown if email/password
  /// accounts are not enabled. Enable email/password accounts in the
  /// Firebase Console, under the Auth tab
  const factory AuthFailure.operationNotAllowed() = OperationNotAllowed;

  const factory AuthFailure.networkConnectionFailed() = NetworkConnectionFailed;

  /// Occasional FirebaseAuth exception trhown when excesive request are sent
  /// during a period of time.
  const factory AuthFailure.tooManyRequests() = TooManyRequests;
}
