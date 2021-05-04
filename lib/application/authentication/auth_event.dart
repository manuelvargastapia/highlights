part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.emailVerificationRequested() =
      EmailVerificationRequested;
  const factory AuthEvent.passwordResetRequested(EmailAddress email) =
      PasswordResetRequested;
  const factory AuthEvent.signedOut() = SignedOut;
}
