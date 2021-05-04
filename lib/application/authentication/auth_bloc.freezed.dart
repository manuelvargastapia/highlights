// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  AuthCheckRequested authCheckRequested() {
    return const AuthCheckRequested();
  }

// ignore: unused_element
  EmailVerificationRequested emailVerificationRequested() {
    return const EmailVerificationRequested();
  }

// ignore: unused_element
  PasswordResetRequested passwordResetRequested(EmailAddress email) {
    return PasswordResetRequested(
      email,
    );
  }

// ignore: unused_element
  SignedOut signedOut() {
    return const SignedOut();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult emailVerificationRequested(),
    @required TResult passwordResetRequested(EmailAddress email),
    @required TResult signedOut(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult emailVerificationRequested(),
    TResult passwordResetRequested(EmailAddress email),
    TResult signedOut(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required
        TResult emailVerificationRequested(EmailVerificationRequested value),
    @required TResult passwordResetRequested(PasswordResetRequested value),
    @required TResult signedOut(SignedOut value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult emailVerificationRequested(EmailVerificationRequested value),
    TResult passwordResetRequested(PasswordResetRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $AuthCheckRequestedCopyWith<$Res> {
  factory $AuthCheckRequestedCopyWith(
          AuthCheckRequested value, $Res Function(AuthCheckRequested) then) =
      _$AuthCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthCheckRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthCheckRequestedCopyWith<$Res> {
  _$AuthCheckRequestedCopyWithImpl(
      AuthCheckRequested _value, $Res Function(AuthCheckRequested) _then)
      : super(_value, (v) => _then(v as AuthCheckRequested));

  @override
  AuthCheckRequested get _value => super._value as AuthCheckRequested;
}

/// @nodoc
class _$AuthCheckRequested implements AuthCheckRequested {
  const _$AuthCheckRequested();

  @override
  String toString() {
    return 'AuthEvent.authCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult emailVerificationRequested(),
    @required TResult passwordResetRequested(EmailAddress email),
    @required TResult signedOut(),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return authCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult emailVerificationRequested(),
    TResult passwordResetRequested(EmailAddress email),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required
        TResult emailVerificationRequested(EmailVerificationRequested value),
    @required TResult passwordResetRequested(PasswordResetRequested value),
    @required TResult signedOut(SignedOut value),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return authCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult emailVerificationRequested(EmailVerificationRequested value),
    TResult passwordResetRequested(PasswordResetRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested(this);
    }
    return orElse();
  }
}

abstract class AuthCheckRequested implements AuthEvent {
  const factory AuthCheckRequested() = _$AuthCheckRequested;
}

/// @nodoc
abstract class $EmailVerificationRequestedCopyWith<$Res> {
  factory $EmailVerificationRequestedCopyWith(EmailVerificationRequested value,
          $Res Function(EmailVerificationRequested) then) =
      _$EmailVerificationRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailVerificationRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $EmailVerificationRequestedCopyWith<$Res> {
  _$EmailVerificationRequestedCopyWithImpl(EmailVerificationRequested _value,
      $Res Function(EmailVerificationRequested) _then)
      : super(_value, (v) => _then(v as EmailVerificationRequested));

  @override
  EmailVerificationRequested get _value =>
      super._value as EmailVerificationRequested;
}

/// @nodoc
class _$EmailVerificationRequested implements EmailVerificationRequested {
  const _$EmailVerificationRequested();

  @override
  String toString() {
    return 'AuthEvent.emailVerificationRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmailVerificationRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult emailVerificationRequested(),
    @required TResult passwordResetRequested(EmailAddress email),
    @required TResult signedOut(),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return emailVerificationRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult emailVerificationRequested(),
    TResult passwordResetRequested(EmailAddress email),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerificationRequested != null) {
      return emailVerificationRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required
        TResult emailVerificationRequested(EmailVerificationRequested value),
    @required TResult passwordResetRequested(PasswordResetRequested value),
    @required TResult signedOut(SignedOut value),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return emailVerificationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult emailVerificationRequested(EmailVerificationRequested value),
    TResult passwordResetRequested(PasswordResetRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerificationRequested != null) {
      return emailVerificationRequested(this);
    }
    return orElse();
  }
}

abstract class EmailVerificationRequested implements AuthEvent {
  const factory EmailVerificationRequested() = _$EmailVerificationRequested;
}

/// @nodoc
abstract class $PasswordResetRequestedCopyWith<$Res> {
  factory $PasswordResetRequestedCopyWith(PasswordResetRequested value,
          $Res Function(PasswordResetRequested) then) =
      _$PasswordResetRequestedCopyWithImpl<$Res>;
  $Res call({EmailAddress email});
}

/// @nodoc
class _$PasswordResetRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $PasswordResetRequestedCopyWith<$Res> {
  _$PasswordResetRequestedCopyWithImpl(PasswordResetRequested _value,
      $Res Function(PasswordResetRequested) _then)
      : super(_value, (v) => _then(v as PasswordResetRequested));

  @override
  PasswordResetRequested get _value => super._value as PasswordResetRequested;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(PasswordResetRequested(
      email == freezed ? _value.email : email as EmailAddress,
    ));
  }
}

/// @nodoc
class _$PasswordResetRequested implements PasswordResetRequested {
  const _$PasswordResetRequested(this.email) : assert(email != null);

  @override
  final EmailAddress email;

  @override
  String toString() {
    return 'AuthEvent.passwordResetRequested(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordResetRequested &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  $PasswordResetRequestedCopyWith<PasswordResetRequested> get copyWith =>
      _$PasswordResetRequestedCopyWithImpl<PasswordResetRequested>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult emailVerificationRequested(),
    @required TResult passwordResetRequested(EmailAddress email),
    @required TResult signedOut(),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return passwordResetRequested(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult emailVerificationRequested(),
    TResult passwordResetRequested(EmailAddress email),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordResetRequested != null) {
      return passwordResetRequested(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required
        TResult emailVerificationRequested(EmailVerificationRequested value),
    @required TResult passwordResetRequested(PasswordResetRequested value),
    @required TResult signedOut(SignedOut value),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return passwordResetRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult emailVerificationRequested(EmailVerificationRequested value),
    TResult passwordResetRequested(PasswordResetRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordResetRequested != null) {
      return passwordResetRequested(this);
    }
    return orElse();
  }
}

abstract class PasswordResetRequested implements AuthEvent {
  const factory PasswordResetRequested(EmailAddress email) =
      _$PasswordResetRequested;

  EmailAddress get email;
  @JsonKey(ignore: true)
  $PasswordResetRequestedCopyWith<PasswordResetRequested> get copyWith;
}

/// @nodoc
abstract class $SignedOutCopyWith<$Res> {
  factory $SignedOutCopyWith(SignedOut value, $Res Function(SignedOut) then) =
      _$SignedOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignedOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $SignedOutCopyWith<$Res> {
  _$SignedOutCopyWithImpl(SignedOut _value, $Res Function(SignedOut) _then)
      : super(_value, (v) => _then(v as SignedOut));

  @override
  SignedOut get _value => super._value as SignedOut;
}

/// @nodoc
class _$SignedOut implements SignedOut {
  const _$SignedOut();

  @override
  String toString() {
    return 'AuthEvent.signedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult emailVerificationRequested(),
    @required TResult passwordResetRequested(EmailAddress email),
    @required TResult signedOut(),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult emailVerificationRequested(),
    TResult passwordResetRequested(EmailAddress email),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required
        TResult emailVerificationRequested(EmailVerificationRequested value),
    @required TResult passwordResetRequested(PasswordResetRequested value),
    @required TResult signedOut(SignedOut value),
  }) {
    assert(authCheckRequested != null);
    assert(emailVerificationRequested != null);
    assert(passwordResetRequested != null);
    assert(signedOut != null);
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult emailVerificationRequested(EmailVerificationRequested value),
    TResult passwordResetRequested(PasswordResetRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class SignedOut implements AuthEvent {
  const factory SignedOut() = _$SignedOut;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Authenticated authenticated() {
    return const _Authenticated();
  }

// ignore: unused_element
  _Unauthenticated unauthenticated() {
    return const _Unauthenticated();
  }

// ignore: unused_element
  _EmailVerificationSent emailVerificationSent() {
    return const _EmailVerificationSent();
  }

// ignore: unused_element
  _SendingEmailVerification sendingEmailVerification() {
    return const _SendingEmailVerification();
  }

// ignore: unused_element
  _EmailVerified emailVerified() {
    return const _EmailVerified();
  }

// ignore: unused_element
  _EmailVerificationFailed emailVerificationFailed(AuthFailure failure) {
    return _EmailVerificationFailed(
      failure,
    );
  }

// ignore: unused_element
  _PasswordResetEmailSent passwordResetEmailSent() {
    return const _PasswordResetEmailSent();
  }

// ignore: unused_element
  _SendingPasswordResetEmail sendingPasswordResetEmail() {
    return const _SendingPasswordResetEmail();
  }

// ignore: unused_element
  _PasswordResetFailed passwordResetFailed(AuthFailure failure) {
    return _PasswordResetFailed(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$AuthenticatedCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) then) =
      __$AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(
      _Authenticated _value, $Res Function(_Authenticated) _then)
      : super(_value, (v) => _then(v as _Authenticated));

  @override
  _Authenticated get _value => super._value as _Authenticated;
}

/// @nodoc
class _$_Authenticated implements _Authenticated {
  const _$_Authenticated();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated() = _$_Authenticated;
}

/// @nodoc
abstract class _$UnauthenticatedCopyWith<$Res> {
  factory _$UnauthenticatedCopyWith(
          _Unauthenticated value, $Res Function(_Unauthenticated) then) =
      __$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$UnauthenticatedCopyWith<$Res> {
  __$UnauthenticatedCopyWithImpl(
      _Unauthenticated _value, $Res Function(_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _Unauthenticated));

  @override
  _Unauthenticated get _value => super._value as _Unauthenticated;
}

/// @nodoc
class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}

/// @nodoc
abstract class _$EmailVerificationSentCopyWith<$Res> {
  factory _$EmailVerificationSentCopyWith(_EmailVerificationSent value,
          $Res Function(_EmailVerificationSent) then) =
      __$EmailVerificationSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailVerificationSentCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$EmailVerificationSentCopyWith<$Res> {
  __$EmailVerificationSentCopyWithImpl(_EmailVerificationSent _value,
      $Res Function(_EmailVerificationSent) _then)
      : super(_value, (v) => _then(v as _EmailVerificationSent));

  @override
  _EmailVerificationSent get _value => super._value as _EmailVerificationSent;
}

/// @nodoc
class _$_EmailVerificationSent implements _EmailVerificationSent {
  const _$_EmailVerificationSent();

  @override
  String toString() {
    return 'AuthState.emailVerificationSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmailVerificationSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return emailVerificationSent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerificationSent != null) {
      return emailVerificationSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return emailVerificationSent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerificationSent != null) {
      return emailVerificationSent(this);
    }
    return orElse();
  }
}

abstract class _EmailVerificationSent implements AuthState {
  const factory _EmailVerificationSent() = _$_EmailVerificationSent;
}

/// @nodoc
abstract class _$SendingEmailVerificationCopyWith<$Res> {
  factory _$SendingEmailVerificationCopyWith(_SendingEmailVerification value,
          $Res Function(_SendingEmailVerification) then) =
      __$SendingEmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class __$SendingEmailVerificationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$SendingEmailVerificationCopyWith<$Res> {
  __$SendingEmailVerificationCopyWithImpl(_SendingEmailVerification _value,
      $Res Function(_SendingEmailVerification) _then)
      : super(_value, (v) => _then(v as _SendingEmailVerification));

  @override
  _SendingEmailVerification get _value =>
      super._value as _SendingEmailVerification;
}

/// @nodoc
class _$_SendingEmailVerification implements _SendingEmailVerification {
  const _$_SendingEmailVerification();

  @override
  String toString() {
    return 'AuthState.sendingEmailVerification()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SendingEmailVerification);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return sendingEmailVerification();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sendingEmailVerification != null) {
      return sendingEmailVerification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return sendingEmailVerification(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sendingEmailVerification != null) {
      return sendingEmailVerification(this);
    }
    return orElse();
  }
}

abstract class _SendingEmailVerification implements AuthState {
  const factory _SendingEmailVerification() = _$_SendingEmailVerification;
}

/// @nodoc
abstract class _$EmailVerifiedCopyWith<$Res> {
  factory _$EmailVerifiedCopyWith(
          _EmailVerified value, $Res Function(_EmailVerified) then) =
      __$EmailVerifiedCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailVerifiedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$EmailVerifiedCopyWith<$Res> {
  __$EmailVerifiedCopyWithImpl(
      _EmailVerified _value, $Res Function(_EmailVerified) _then)
      : super(_value, (v) => _then(v as _EmailVerified));

  @override
  _EmailVerified get _value => super._value as _EmailVerified;
}

/// @nodoc
class _$_EmailVerified implements _EmailVerified {
  const _$_EmailVerified();

  @override
  String toString() {
    return 'AuthState.emailVerified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmailVerified);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return emailVerified();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerified != null) {
      return emailVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return emailVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerified != null) {
      return emailVerified(this);
    }
    return orElse();
  }
}

abstract class _EmailVerified implements AuthState {
  const factory _EmailVerified() = _$_EmailVerified;
}

/// @nodoc
abstract class _$EmailVerificationFailedCopyWith<$Res> {
  factory _$EmailVerificationFailedCopyWith(_EmailVerificationFailed value,
          $Res Function(_EmailVerificationFailed) then) =
      __$EmailVerificationFailedCopyWithImpl<$Res>;
  $Res call({AuthFailure failure});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$EmailVerificationFailedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$EmailVerificationFailedCopyWith<$Res> {
  __$EmailVerificationFailedCopyWithImpl(_EmailVerificationFailed _value,
      $Res Function(_EmailVerificationFailed) _then)
      : super(_value, (v) => _then(v as _EmailVerificationFailed));

  @override
  _EmailVerificationFailed get _value =>
      super._value as _EmailVerificationFailed;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_EmailVerificationFailed(
      failure == freezed ? _value.failure : failure as AuthFailure,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $AuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_EmailVerificationFailed implements _EmailVerificationFailed {
  const _$_EmailVerificationFailed(this.failure) : assert(failure != null);

  @override
  final AuthFailure failure;

  @override
  String toString() {
    return 'AuthState.emailVerificationFailed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailVerificationFailed &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$EmailVerificationFailedCopyWith<_EmailVerificationFailed> get copyWith =>
      __$EmailVerificationFailedCopyWithImpl<_EmailVerificationFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return emailVerificationFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerificationFailed != null) {
      return emailVerificationFailed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return emailVerificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailVerificationFailed != null) {
      return emailVerificationFailed(this);
    }
    return orElse();
  }
}

abstract class _EmailVerificationFailed implements AuthState {
  const factory _EmailVerificationFailed(AuthFailure failure) =
      _$_EmailVerificationFailed;

  AuthFailure get failure;
  @JsonKey(ignore: true)
  _$EmailVerificationFailedCopyWith<_EmailVerificationFailed> get copyWith;
}

/// @nodoc
abstract class _$PasswordResetEmailSentCopyWith<$Res> {
  factory _$PasswordResetEmailSentCopyWith(_PasswordResetEmailSent value,
          $Res Function(_PasswordResetEmailSent) then) =
      __$PasswordResetEmailSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$PasswordResetEmailSentCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$PasswordResetEmailSentCopyWith<$Res> {
  __$PasswordResetEmailSentCopyWithImpl(_PasswordResetEmailSent _value,
      $Res Function(_PasswordResetEmailSent) _then)
      : super(_value, (v) => _then(v as _PasswordResetEmailSent));

  @override
  _PasswordResetEmailSent get _value => super._value as _PasswordResetEmailSent;
}

/// @nodoc
class _$_PasswordResetEmailSent implements _PasswordResetEmailSent {
  const _$_PasswordResetEmailSent();

  @override
  String toString() {
    return 'AuthState.passwordResetEmailSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PasswordResetEmailSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return passwordResetEmailSent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordResetEmailSent != null) {
      return passwordResetEmailSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return passwordResetEmailSent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordResetEmailSent != null) {
      return passwordResetEmailSent(this);
    }
    return orElse();
  }
}

abstract class _PasswordResetEmailSent implements AuthState {
  const factory _PasswordResetEmailSent() = _$_PasswordResetEmailSent;
}

/// @nodoc
abstract class _$SendingPasswordResetEmailCopyWith<$Res> {
  factory _$SendingPasswordResetEmailCopyWith(_SendingPasswordResetEmail value,
          $Res Function(_SendingPasswordResetEmail) then) =
      __$SendingPasswordResetEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$SendingPasswordResetEmailCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$SendingPasswordResetEmailCopyWith<$Res> {
  __$SendingPasswordResetEmailCopyWithImpl(_SendingPasswordResetEmail _value,
      $Res Function(_SendingPasswordResetEmail) _then)
      : super(_value, (v) => _then(v as _SendingPasswordResetEmail));

  @override
  _SendingPasswordResetEmail get _value =>
      super._value as _SendingPasswordResetEmail;
}

/// @nodoc
class _$_SendingPasswordResetEmail implements _SendingPasswordResetEmail {
  const _$_SendingPasswordResetEmail();

  @override
  String toString() {
    return 'AuthState.sendingPasswordResetEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SendingPasswordResetEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return sendingPasswordResetEmail();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sendingPasswordResetEmail != null) {
      return sendingPasswordResetEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return sendingPasswordResetEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sendingPasswordResetEmail != null) {
      return sendingPasswordResetEmail(this);
    }
    return orElse();
  }
}

abstract class _SendingPasswordResetEmail implements AuthState {
  const factory _SendingPasswordResetEmail() = _$_SendingPasswordResetEmail;
}

/// @nodoc
abstract class _$PasswordResetFailedCopyWith<$Res> {
  factory _$PasswordResetFailedCopyWith(_PasswordResetFailed value,
          $Res Function(_PasswordResetFailed) then) =
      __$PasswordResetFailedCopyWithImpl<$Res>;
  $Res call({AuthFailure failure});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$PasswordResetFailedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$PasswordResetFailedCopyWith<$Res> {
  __$PasswordResetFailedCopyWithImpl(
      _PasswordResetFailed _value, $Res Function(_PasswordResetFailed) _then)
      : super(_value, (v) => _then(v as _PasswordResetFailed));

  @override
  _PasswordResetFailed get _value => super._value as _PasswordResetFailed;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_PasswordResetFailed(
      failure == freezed ? _value.failure : failure as AuthFailure,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $AuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_PasswordResetFailed implements _PasswordResetFailed {
  const _$_PasswordResetFailed(this.failure) : assert(failure != null);

  @override
  final AuthFailure failure;

  @override
  String toString() {
    return 'AuthState.passwordResetFailed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordResetFailed &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$PasswordResetFailedCopyWith<_PasswordResetFailed> get copyWith =>
      __$PasswordResetFailedCopyWithImpl<_PasswordResetFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult emailVerificationSent(),
    @required TResult sendingEmailVerification(),
    @required TResult emailVerified(),
    @required TResult emailVerificationFailed(AuthFailure failure),
    @required TResult passwordResetEmailSent(),
    @required TResult sendingPasswordResetEmail(),
    @required TResult passwordResetFailed(AuthFailure failure),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return passwordResetFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult emailVerificationSent(),
    TResult sendingEmailVerification(),
    TResult emailVerified(),
    TResult emailVerificationFailed(AuthFailure failure),
    TResult passwordResetEmailSent(),
    TResult sendingPasswordResetEmail(),
    TResult passwordResetFailed(AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordResetFailed != null) {
      return passwordResetFailed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult authenticated(_Authenticated value),
    @required TResult unauthenticated(_Unauthenticated value),
    @required TResult emailVerificationSent(_EmailVerificationSent value),
    @required TResult sendingEmailVerification(_SendingEmailVerification value),
    @required TResult emailVerified(_EmailVerified value),
    @required TResult emailVerificationFailed(_EmailVerificationFailed value),
    @required TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    @required
        TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    @required TResult passwordResetFailed(_PasswordResetFailed value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(emailVerificationSent != null);
    assert(sendingEmailVerification != null);
    assert(emailVerified != null);
    assert(emailVerificationFailed != null);
    assert(passwordResetEmailSent != null);
    assert(sendingPasswordResetEmail != null);
    assert(passwordResetFailed != null);
    return passwordResetFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult authenticated(_Authenticated value),
    TResult unauthenticated(_Unauthenticated value),
    TResult emailVerificationSent(_EmailVerificationSent value),
    TResult sendingEmailVerification(_SendingEmailVerification value),
    TResult emailVerified(_EmailVerified value),
    TResult emailVerificationFailed(_EmailVerificationFailed value),
    TResult passwordResetEmailSent(_PasswordResetEmailSent value),
    TResult sendingPasswordResetEmail(_SendingPasswordResetEmail value),
    TResult passwordResetFailed(_PasswordResetFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordResetFailed != null) {
      return passwordResetFailed(this);
    }
    return orElse();
  }
}

abstract class _PasswordResetFailed implements AuthState {
  const factory _PasswordResetFailed(AuthFailure failure) =
      _$_PasswordResetFailed;

  AuthFailure get failure;
  @JsonKey(ignore: true)
  _$PasswordResetFailedCopyWith<_PasswordResetFailed> get copyWith;
}
