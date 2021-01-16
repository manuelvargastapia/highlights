import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/application/authentication/sign_in_form/sign_in_form_bloc.dart';

class MockAuthFacade extends Mock implements IAuthFacade {}

void main() {
  MockAuthFacade mockAuthFacade;
  final signInFormStateInitial = SignInFormState.initial();

  setUp(() {
    mockAuthFacade = MockAuthFacade();
  });

  group('EmailChanged', () {
    const emailAddress = "test@test.test";
    blocTest(
      "Given a change in emailAddress When event EmailChanged ocurrs Then emitts [signInFormStateInitial, SignInFormState(emailAddress: EmailAddress(emailAddress), authFailureOrSuccessOption: none())]",
      build: () => SignInFormBloc(mockAuthFacade),
      act: (bloc) => bloc.add(const SignInFormEvent.emailChanged(emailAddress)),
      expect: [
        signInFormStateInitial,
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(emailAddress),
          authFailureOrSuccessOption: none(),
        ),
      ],
    );
  });
  group('PasswordChanged', () {
    const password = "123456";
    blocTest(
      "Given a change in password When event PasswordChanged ocurrs Then emitts [signInFormStateInitial, SignInFormState(password: Password(password), authFailureOrSuccessOption: none())]",
      build: () => SignInFormBloc(mockAuthFacade),
      act: (bloc) => bloc.add(const SignInFormEvent.passwordChanged(password)),
      expect: [
        signInFormStateInitial,
        signInFormStateInitial.copyWith(
          password: Password(password),
          authFailureOrSuccessOption: none(),
        ),
      ],
    );
  });
  group('RegisterWithEmailAndPasswordPessed', () {
    Either<AuthFailure, Unit> mockAuthFacadeResult;
    const validEmailAddress = "test@test.test";
    const validPassword = "123456";
    const invalidEmailAddress = "testtest.test";
    const invalidPassword = "123";

    blocTest(
      'Given valid emailAddress and password When RegisterWithEmailAndPasswordPessed ocurrs Then emitts [SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: true, authFailureOrSuccessOption: none()), SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: false, showErrorMessages: true, authFailureOrSuccessOption: optionOf(mockAuthFacadeResult))]',
      build: () {
        when(mockAuthFacade.registerWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        )).thenAnswer((_) async => mockAuthFacadeResult);
        return SignInFormBloc(mockAuthFacade);
      },
      act: (bloc) => bloc
        ..add(const SignInFormEvent.emailChanged(validEmailAddress))
        ..add(const SignInFormEvent.passwordChanged(validPassword))
        ..add(
          const SignInFormEvent.registerWithEmailAndPasswordPessed(),
        ),
      expect: [
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(validEmailAddress),
          password: Password(validPassword),
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(validEmailAddress),
          password: Password(validPassword),
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(mockAuthFacadeResult),
        ),
      ],
      skip: 3,
      verify: (_) {
        verify(mockAuthFacade.registerWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        )).called(1);
      },
    );

    blocTest(
      'Given invalid emailAddress and password When RegisterWithEmailAndPasswordPessed ocurrs Then emitts [SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: true, authFailureOrSuccessOption: none()), SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: false, showErrorMessages: true, authFailureOrSuccessOption: optionOf(mockAuthFacadeResult))]',
      build: () {
        when(mockAuthFacade.registerWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        )).thenAnswer((_) async => mockAuthFacadeResult);
        return SignInFormBloc(mockAuthFacade);
      },
      act: (bloc) => bloc
        ..add(const SignInFormEvent.emailChanged(invalidEmailAddress))
        ..add(const SignInFormEvent.passwordChanged(invalidPassword))
        ..add(
          const SignInFormEvent.registerWithEmailAndPasswordPessed(),
        ),
      expect: [
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(invalidEmailAddress),
          password: Password(invalidPassword),
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(mockAuthFacadeResult),
        ),
      ],
      skip: 3,
      verify: (_) {
        verifyNever(mockAuthFacade.registerWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        ));
      },
    );
  });
  group('SigInWithEmailAndPasswordPessed', () {
    Either<AuthFailure, Unit> mockAuthFacadeResult;
    const validEmailAddress = "test@test.test";
    const validPassword = "123456";
    const invalidEmailAddress = "testtest.test";
    const invalidPassword = "123";

    blocTest(
      'Given valid emailAddress and password When SigInWithEmailAndPasswordPessed ocurrs Then emitts [SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: true, authFailureOrSuccessOption: none()), SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: false, showErrorMessages: true, authFailureOrSuccessOption: optionOf(mockAuthFacadeResult))]',
      build: () {
        when(mockAuthFacade.signInWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        )).thenAnswer((_) async => mockAuthFacadeResult);
        return SignInFormBloc(mockAuthFacade);
      },
      act: (bloc) => bloc
        ..add(const SignInFormEvent.emailChanged(validEmailAddress))
        ..add(const SignInFormEvent.passwordChanged(validPassword))
        ..add(
          const SignInFormEvent.sigInWithEmailAndPasswordPessed(),
        ),
      expect: [
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(validEmailAddress),
          password: Password(validPassword),
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(validEmailAddress),
          password: Password(validPassword),
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(mockAuthFacadeResult),
        ),
      ],
      skip: 3,
      verify: (_) {
        verify(mockAuthFacade.signInWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        )).called(1);
      },
    );

    blocTest(
      'Given invalid emailAddress and password When SigInWithEmailAndPasswordPessed ocurrs Then emitts [SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: true, authFailureOrSuccessOption: none()), SignInFormState(emailAddress: EmailAddress(validEmailAddress), password: Password(validPassword), isSubmitting: false, showErrorMessages: true, authFailureOrSuccessOption: optionOf(mockAuthFacadeResult))]',
      build: () {
        when(mockAuthFacade.signInWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        )).thenAnswer((_) async => mockAuthFacadeResult);
        return SignInFormBloc(mockAuthFacade);
      },
      act: (bloc) => bloc
        ..add(const SignInFormEvent.emailChanged(invalidEmailAddress))
        ..add(const SignInFormEvent.passwordChanged(invalidPassword))
        ..add(
          const SignInFormEvent.sigInWithEmailAndPasswordPessed(),
        ),
      expect: [
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(invalidEmailAddress),
          password: Password(invalidPassword),
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(mockAuthFacadeResult),
        ),
      ],
      skip: 3,
      verify: (_) {
        verifyNever(mockAuthFacade.signInWithEmailAndPassword(
          emailAddress: anyNamed("emailAddress"),
          password: anyNamed("password"),
        ));
      },
    );
  });
  group('SigInWithGooglePessed', () {
    Either<AuthFailure, Unit> mockAuthFacadeResult;

    blocTest(
      'Given initial state When SigInWithGooglePessed ocurrs Then emitts [signInFormStateInitial, SignInFormState(isSubmitting: true, authFailureOrSuccessOption: none()), SignInFormState(isSubmitting: false, authFailureOrSuccessOption: some(result))]',
      build: () {
        when(mockAuthFacade.signInWithGoogle())
            .thenAnswer((_) async => mockAuthFacadeResult);
        return SignInFormBloc(mockAuthFacade);
      },
      act: (bloc) => bloc.add(const SignInFormEvent.sigInWithGooglePessed()),
      expect: [
        signInFormStateInitial,
        signInFormStateInitial.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        signInFormStateInitial.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(mockAuthFacadeResult),
        ),
      ],
      verify: (_) {
        verify(mockAuthFacade.signInWithGoogle()).called(1);
      },
    );

    const emailAddress = "test@test.test";
    const password = "123456";

    blocTest(
      'Given a non-initial state When SigInWithGooglePessed ocurrs Then emitts [SignInFormState(emailAddress: EmailAddress(emailAddress), password: Password(password), isSubmitting: true, authFailureOrSuccessOption: none()), SignInFormState(emailAddress: EmailAddress(emailAddress), password: Password(password), isSubmitting: false, authFailureOrSuccessOption: some(result))]',
      build: () {
        when(mockAuthFacade.signInWithGoogle())
            .thenAnswer((_) async => mockAuthFacadeResult);
        return SignInFormBloc(mockAuthFacade);
      },
      act: (bloc) => bloc
        ..add(const SignInFormEvent.emailChanged(emailAddress))
        ..add(const SignInFormEvent.passwordChanged(password))
        ..add(const SignInFormEvent.sigInWithGooglePessed()),
      expect: [
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(emailAddress),
          password: Password(password),
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        signInFormStateInitial.copyWith(
          emailAddress: EmailAddress(emailAddress),
          password: Password(password),
          isSubmitting: false,
          authFailureOrSuccessOption: some(mockAuthFacadeResult),
        ),
      ],
      skip: 3,
      verify: (_) {
        verify(mockAuthFacade.signInWithGoogle()).called(1);
      },
    );
  });
}
