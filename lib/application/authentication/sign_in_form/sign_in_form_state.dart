part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  /// Unique data class that represents the state of the SignInForm bloc
  ///
  /// [emailAddress] and [password] are the _value_objetcs_ responsible for
  /// validations. [isSubmitting] indicates whether the progress bar should be
  /// shown. [showErrorMessages] controls the reactive behavior of errors shown
  /// on form fields. And [authFailureOrSuccessOption] is an `Option<T>` that
  /// allows us to return a `None` value to represent the state of no value
  /// available. That is, there is no sign in in progress nor an already
  /// processed result.
  const factory SignInFormState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(""),
        password: Password(""),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
