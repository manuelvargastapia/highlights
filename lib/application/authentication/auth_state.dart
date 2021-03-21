part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.emailVerificationSent() = _EmailVerificationSent;
  const factory AuthState.sendingEmailVerification() =
      _SendingEmailVerification;
  const factory AuthState.emailVerified() = _EmailVerified;
  const factory AuthState.emailVerificationFailed(
    AuthFailure failure,
  ) = _EmailVerificationFailed;
  const factory AuthState.passwordResetEmailSent() = _PasswordResetEmailSent;
  const factory AuthState.sendingPasswordResetEmail() =
      _SendingPasswordResetEmail;
  const factory AuthState.passwordResetFailed(
    AuthFailure failure,
  ) = _PasswordResetFailed;
}
