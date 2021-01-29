// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SignInFormEventTearOff {
  const _$SignInFormEventTearOff();

// ignore: unused_element
  EmailChanged emailChanged(String emailString) {
    return EmailChanged(
      emailString,
    );
  }

// ignore: unused_element
  PasswordChanged passwordChanged(String passwordString) {
    return PasswordChanged(
      passwordString,
    );
  }

// ignore: unused_element
  RegisterWithEmailAndPasswordPessed registerWithEmailAndPasswordPessed() {
    return const RegisterWithEmailAndPasswordPessed();
  }

// ignore: unused_element
  SigInWithEmailAndPasswordPessed sigInWithEmailAndPasswordPessed() {
    return const SigInWithEmailAndPasswordPessed();
  }

// ignore: unused_element
  SigInWithGooglePessed sigInWithGooglePessed() {
    return const SigInWithGooglePessed();
  }
}

/// @nodoc
// ignore: unused_element
const $SignInFormEvent = _$SignInFormEventTearOff();

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPessed(),
    @required TResult sigInWithEmailAndPasswordPessed(),
    @required TResult sigInWithGooglePessed(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPessed(),
    TResult sigInWithEmailAndPasswordPessed(),
    TResult sigInWithGooglePessed(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPessed(
            RegisterWithEmailAndPasswordPessed value),
    @required
        TResult sigInWithEmailAndPasswordPessed(
            SigInWithEmailAndPasswordPessed value),
    @required TResult sigInWithGooglePessed(SigInWithGooglePessed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPessed(
        RegisterWithEmailAndPasswordPessed value),
    TResult sigInWithEmailAndPasswordPessed(
        SigInWithEmailAndPasswordPessed value),
    TResult sigInWithGooglePessed(SigInWithGooglePessed value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  final SignInFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignInFormEvent) _then;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailString});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object emailString = freezed,
  }) {
    return _then(EmailChanged(
      emailString == freezed ? _value.emailString : emailString as String,
    ));
  }
}

/// @nodoc
class _$EmailChanged with DiagnosticableTreeMixin implements EmailChanged {
  const _$EmailChanged(this.emailString) : assert(emailString != null);

  @override
  final String emailString;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.emailChanged(emailString: $emailString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.emailChanged'))
      ..add(DiagnosticsProperty('emailString', emailString));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.emailString, emailString) ||
                const DeepCollectionEquality()
                    .equals(other.emailString, emailString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(emailString);

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPessed(),
    @required TResult sigInWithEmailAndPasswordPessed(),
    @required TResult sigInWithGooglePessed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return emailChanged(emailString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPessed(),
    TResult sigInWithEmailAndPasswordPessed(),
    TResult sigInWithGooglePessed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(emailString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPessed(
            RegisterWithEmailAndPasswordPessed value),
    @required
        TResult sigInWithEmailAndPasswordPessed(
            SigInWithEmailAndPasswordPessed value),
    @required TResult sigInWithGooglePessed(SigInWithGooglePessed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPessed(
        RegisterWithEmailAndPasswordPessed value),
    TResult sigInWithEmailAndPasswordPessed(
        SigInWithEmailAndPasswordPessed value),
    TResult sigInWithGooglePessed(SigInWithGooglePessed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements SignInFormEvent {
  const factory EmailChanged(String emailString) = _$EmailChanged;

  String get emailString;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordString});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object passwordString = freezed,
  }) {
    return _then(PasswordChanged(
      passwordString == freezed
          ? _value.passwordString
          : passwordString as String,
    ));
  }
}

/// @nodoc
class _$PasswordChanged
    with DiagnosticableTreeMixin
    implements PasswordChanged {
  const _$PasswordChanged(this.passwordString) : assert(passwordString != null);

  @override
  final String passwordString;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.passwordChanged(passwordString: $passwordString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.passwordChanged'))
      ..add(DiagnosticsProperty('passwordString', passwordString));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.passwordString, passwordString) ||
                const DeepCollectionEquality()
                    .equals(other.passwordString, passwordString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(passwordString);

  @JsonKey(ignore: true)
  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPessed(),
    @required TResult sigInWithEmailAndPasswordPessed(),
    @required TResult sigInWithGooglePessed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return passwordChanged(passwordString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPessed(),
    TResult sigInWithEmailAndPasswordPessed(),
    TResult sigInWithGooglePessed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(passwordString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPessed(
            RegisterWithEmailAndPasswordPessed value),
    @required
        TResult sigInWithEmailAndPasswordPessed(
            SigInWithEmailAndPasswordPessed value),
    @required TResult sigInWithGooglePessed(SigInWithGooglePessed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPessed(
        RegisterWithEmailAndPasswordPessed value),
    TResult sigInWithEmailAndPasswordPessed(
        SigInWithEmailAndPasswordPessed value),
    TResult sigInWithGooglePessed(SigInWithGooglePessed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInFormEvent {
  const factory PasswordChanged(String passwordString) = _$PasswordChanged;

  String get passwordString;
  @JsonKey(ignore: true)
  $PasswordChangedCopyWith<PasswordChanged> get copyWith;
}

/// @nodoc
abstract class $RegisterWithEmailAndPasswordPessedCopyWith<$Res> {
  factory $RegisterWithEmailAndPasswordPessedCopyWith(
          RegisterWithEmailAndPasswordPessed value,
          $Res Function(RegisterWithEmailAndPasswordPessed) then) =
      _$RegisterWithEmailAndPasswordPessedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterWithEmailAndPasswordPessedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $RegisterWithEmailAndPasswordPessedCopyWith<$Res> {
  _$RegisterWithEmailAndPasswordPessedCopyWithImpl(
      RegisterWithEmailAndPasswordPessed _value,
      $Res Function(RegisterWithEmailAndPasswordPessed) _then)
      : super(_value, (v) => _then(v as RegisterWithEmailAndPasswordPessed));

  @override
  RegisterWithEmailAndPasswordPessed get _value =>
      super._value as RegisterWithEmailAndPasswordPessed;
}

/// @nodoc
class _$RegisterWithEmailAndPasswordPessed
    with DiagnosticableTreeMixin
    implements RegisterWithEmailAndPasswordPessed {
  const _$RegisterWithEmailAndPasswordPessed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.registerWithEmailAndPasswordPessed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SignInFormEvent.registerWithEmailAndPasswordPessed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterWithEmailAndPasswordPessed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPessed(),
    @required TResult sigInWithEmailAndPasswordPessed(),
    @required TResult sigInWithGooglePessed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return registerWithEmailAndPasswordPessed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPessed(),
    TResult sigInWithEmailAndPasswordPessed(),
    TResult sigInWithGooglePessed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPasswordPessed != null) {
      return registerWithEmailAndPasswordPessed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPessed(
            RegisterWithEmailAndPasswordPessed value),
    @required
        TResult sigInWithEmailAndPasswordPessed(
            SigInWithEmailAndPasswordPessed value),
    @required TResult sigInWithGooglePessed(SigInWithGooglePessed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return registerWithEmailAndPasswordPessed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPessed(
        RegisterWithEmailAndPasswordPessed value),
    TResult sigInWithEmailAndPasswordPessed(
        SigInWithEmailAndPasswordPessed value),
    TResult sigInWithGooglePessed(SigInWithGooglePessed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPasswordPessed != null) {
      return registerWithEmailAndPasswordPessed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithEmailAndPasswordPessed implements SignInFormEvent {
  const factory RegisterWithEmailAndPasswordPessed() =
      _$RegisterWithEmailAndPasswordPessed;
}

/// @nodoc
abstract class $SigInWithEmailAndPasswordPessedCopyWith<$Res> {
  factory $SigInWithEmailAndPasswordPessedCopyWith(
          SigInWithEmailAndPasswordPessed value,
          $Res Function(SigInWithEmailAndPasswordPessed) then) =
      _$SigInWithEmailAndPasswordPessedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SigInWithEmailAndPasswordPessedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SigInWithEmailAndPasswordPessedCopyWith<$Res> {
  _$SigInWithEmailAndPasswordPessedCopyWithImpl(
      SigInWithEmailAndPasswordPessed _value,
      $Res Function(SigInWithEmailAndPasswordPessed) _then)
      : super(_value, (v) => _then(v as SigInWithEmailAndPasswordPessed));

  @override
  SigInWithEmailAndPasswordPessed get _value =>
      super._value as SigInWithEmailAndPasswordPessed;
}

/// @nodoc
class _$SigInWithEmailAndPasswordPessed
    with DiagnosticableTreeMixin
    implements SigInWithEmailAndPasswordPessed {
  const _$SigInWithEmailAndPasswordPessed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.sigInWithEmailAndPasswordPessed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SignInFormEvent.sigInWithEmailAndPasswordPessed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SigInWithEmailAndPasswordPessed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPessed(),
    @required TResult sigInWithEmailAndPasswordPessed(),
    @required TResult sigInWithGooglePessed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return sigInWithEmailAndPasswordPessed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPessed(),
    TResult sigInWithEmailAndPasswordPessed(),
    TResult sigInWithGooglePessed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sigInWithEmailAndPasswordPessed != null) {
      return sigInWithEmailAndPasswordPessed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPessed(
            RegisterWithEmailAndPasswordPessed value),
    @required
        TResult sigInWithEmailAndPasswordPessed(
            SigInWithEmailAndPasswordPessed value),
    @required TResult sigInWithGooglePessed(SigInWithGooglePessed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return sigInWithEmailAndPasswordPessed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPessed(
        RegisterWithEmailAndPasswordPessed value),
    TResult sigInWithEmailAndPasswordPessed(
        SigInWithEmailAndPasswordPessed value),
    TResult sigInWithGooglePessed(SigInWithGooglePessed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sigInWithEmailAndPasswordPessed != null) {
      return sigInWithEmailAndPasswordPessed(this);
    }
    return orElse();
  }
}

abstract class SigInWithEmailAndPasswordPessed implements SignInFormEvent {
  const factory SigInWithEmailAndPasswordPessed() =
      _$SigInWithEmailAndPasswordPessed;
}

/// @nodoc
abstract class $SigInWithGooglePessedCopyWith<$Res> {
  factory $SigInWithGooglePessedCopyWith(SigInWithGooglePessed value,
          $Res Function(SigInWithGooglePessed) then) =
      _$SigInWithGooglePessedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SigInWithGooglePessedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SigInWithGooglePessedCopyWith<$Res> {
  _$SigInWithGooglePessedCopyWithImpl(
      SigInWithGooglePessed _value, $Res Function(SigInWithGooglePessed) _then)
      : super(_value, (v) => _then(v as SigInWithGooglePessed));

  @override
  SigInWithGooglePessed get _value => super._value as SigInWithGooglePessed;
}

/// @nodoc
class _$SigInWithGooglePessed
    with DiagnosticableTreeMixin
    implements SigInWithGooglePessed {
  const _$SigInWithGooglePessed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.sigInWithGooglePessed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'SignInFormEvent.sigInWithGooglePessed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SigInWithGooglePessed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPessed(),
    @required TResult sigInWithEmailAndPasswordPessed(),
    @required TResult sigInWithGooglePessed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return sigInWithGooglePessed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPessed(),
    TResult sigInWithEmailAndPasswordPessed(),
    TResult sigInWithGooglePessed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sigInWithGooglePessed != null) {
      return sigInWithGooglePessed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPessed(
            RegisterWithEmailAndPasswordPessed value),
    @required
        TResult sigInWithEmailAndPasswordPessed(
            SigInWithEmailAndPasswordPessed value),
    @required TResult sigInWithGooglePessed(SigInWithGooglePessed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPessed != null);
    assert(sigInWithEmailAndPasswordPessed != null);
    assert(sigInWithGooglePessed != null);
    return sigInWithGooglePessed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPessed(
        RegisterWithEmailAndPasswordPessed value),
    TResult sigInWithEmailAndPasswordPessed(
        SigInWithEmailAndPasswordPessed value),
    TResult sigInWithGooglePessed(SigInWithGooglePessed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sigInWithGooglePessed != null) {
      return sigInWithGooglePessed(this);
    }
    return orElse();
  }
}

abstract class SigInWithGooglePessed implements SignInFormEvent {
  const factory SigInWithGooglePessed() = _$SigInWithGooglePessed;
}

/// @nodoc
class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

// ignore: unused_element
  _SignInFormState call(
      {@required EmailAddress emailAddress,
      @required Password password,
      @required bool isSubmitting,
      @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) {
    return _SignInFormState(
      emailAddress: emailAddress,
      password: password,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignInFormState = _$SignInFormStateTearOff();

/// @nodoc
mixin _$SignInFormState {
  EmailAddress get emailAddress;
  Password get password;
  bool get isSubmitting;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

  @override
  $Res call({
    Object emailAddress = freezed,
    Object password = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? _value.password : password as Password,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$SignInFormStateCopyWith(
          _SignInFormState value, $Res Function(_SignInFormState) then) =
      __$SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$SignInFormStateCopyWith<$Res> {
  __$SignInFormStateCopyWithImpl(
      _SignInFormState _value, $Res Function(_SignInFormState) _then)
      : super(_value, (v) => _then(v as _SignInFormState));

  @override
  _SignInFormState get _value => super._value as _SignInFormState;

  @override
  $Res call({
    Object emailAddress = freezed,
    Object password = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_SignInFormState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? _value.password : password as Password,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_SignInFormState
    with DiagnosticableTreeMixin
    implements _SignInFormState {
  const _$_SignInFormState(
      {@required this.emailAddress,
      @required this.password,
      @required this.isSubmitting,
      @required this.authFailureOrSuccessOption})
      : assert(emailAddress != null),
        assert(password != null),
        assert(isSubmitting != null),
        assert(authFailureOrSuccessOption != null);

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormState(emailAddress: $emailAddress, password: $password, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormState'))
      ..add(DiagnosticsProperty('emailAddress', emailAddress))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty(
          'authFailureOrSuccessOption', authFailureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInFormState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      __$SignInFormStateCopyWithImpl<_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
          {@required
              EmailAddress emailAddress,
          @required
              Password password,
          @required
              bool isSubmitting,
          @required
              Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) =
      _$_SignInFormState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith;
}
