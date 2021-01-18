import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/infrastructure/authentication/core/auth_provider_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:highlights/domain/core/errors.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockUserCredential extends Mock implements UserCredential {}

// ignore: avoid_implementing_value_types
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockOAuthCredential extends Mock implements OAuthCredential {}

class MockAuthProviderManager extends Mock implements AuthProviderManager {}

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  MockGoogleSignIn mockGoogleSignIn;
  MockUserCredential mockUserCredential;
  MockGoogleSignInAccount mockGoogleSignInAccount;
  MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
  MockOAuthCredential mockOAuthCredential;
  MockAuthProviderManager mockAuthProviderManager;
  FirebaseAuthFacade firebaseAuthFacade;
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockUserCredential = MockUserCredential();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
    mockOAuthCredential = MockOAuthCredential();
    mockAuthProviderManager = MockAuthProviderManager();
    firebaseAuthFacade = FirebaseAuthFacade(
      mockFirebaseAuth,
      mockGoogleSignIn,
      mockAuthProviderManager,
    );
  });

  group('Register with email and password', () {
    const validEmailString = "test@test.test";
    const validPasswordString = "123456";
    const invalidEmailString = "testtest.test";
    const invalidPasswordString = "123";
    test(
      'Given valid email and password When registering Then return Right(unit)',
      () async {
        when(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: validEmailString,
          password: validPasswordString,
        )).thenAnswer((_) async => mockUserCredential);

        final result = await firebaseAuthFacade.registerWithEmailAndPassword(
          emailAddress: EmailAddress(validEmailString),
          password: Password(validPasswordString),
        );

        expect(result.isRight(), isTrue);
        result.fold(
          (_) {},
          (value) {
            expect(value, unit);
          },
        );

        verify(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: anyNamed("email"),
          password: anyNamed("password"),
        )).called(1);
      },
    );

    test(
      'Given invalid email and password When registering Then throw UnexpectedValueError',
      () async {
        expect(
          () => firebaseAuthFacade.registerWithEmailAndPassword(
            emailAddress: EmailAddress(invalidEmailString),
            password: Password(invalidPasswordString),
          ),
          throwsA(isInstanceOf<UnexpectedValueError>()),
        );

        verifyNever(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: anyNamed("email"),
          password: anyNamed("password"),
        ));
      },
    );

    group('FirebaseAuthException cases', () {
      test(
        'Given email already in use When registering Then return EmailAlreadyInUse',
        () async {
          when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).thenThrow(PlatformException(code: "email-already-in-use"));

          final result = await firebaseAuthFacade.registerWithEmailAndPassword(
            emailAddress: EmailAddress(validEmailString),
            password: Password(validPasswordString),
          );

          expect(result.isLeft(), true);
          result.fold(
            (failure) {
              expect(failure, isA<EmailAlreadyInUse>());
            },
            (_) {},
          );

          verify(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).called(1);
        },
      );

      test(
        'Given email and password not enabled When registering Then return OperationNotAllowed',
        () async {
          when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).thenThrow(PlatformException(code: "operation-not-allowed"));

          final result = await firebaseAuthFacade.registerWithEmailAndPassword(
            emailAddress: EmailAddress(validEmailString),
            password: Password(validPasswordString),
          );

          expect(result.isLeft(), isTrue);
          result.fold(
            (failure) {
              expect(failure, isA<OperationNotAllowed>());
            },
            (_) {},
          );

          verify(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).called(1);
        },
      );

      test(
        'Given any other error When registering Then return ServerError',
        () async {
          when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).thenThrow(PlatformException(code: "other code"));

          final result = await firebaseAuthFacade.registerWithEmailAndPassword(
            emailAddress: EmailAddress(validEmailString),
            password: Password(validPasswordString),
          );

          expect(result.isLeft(), isTrue);
          result.fold(
            (failure) {
              expect(failure, isA<ServerError>());
            },
            (_) {},
          );

          verify(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).called(1);
        },
      );
    });
  });

  group('Sign in with email and password', () {
    const validEmailString = "test@test.test";
    const validPasswordString = "123456";
    const invalidEmailString = "testtest.test";
    const invalidPasswordString = "123";
    test(
      'Given valid email and password When sign in Then return Right(unit)',
      () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
          email: validEmailString,
          password: validPasswordString,
        )).thenAnswer((_) async => mockUserCredential);

        final result = await firebaseAuthFacade.signInWithEmailAndPassword(
          emailAddress: EmailAddress(validEmailString),
          password: Password(validPasswordString),
        );

        expect(result.isRight(), isTrue);
        result.fold(
          (_) {},
          (value) {
            expect(value, unit);
          },
        );

        verify(mockFirebaseAuth.signInWithEmailAndPassword(
          email: anyNamed("email"),
          password: anyNamed("password"),
        )).called(1);
      },
    );

    test(
      'Given invalid email and password When sign in Then throw UnexpectedValueError',
      () async {
        expect(
          () => firebaseAuthFacade.signInWithEmailAndPassword(
            emailAddress: EmailAddress(invalidEmailString),
            password: Password(invalidPasswordString),
          ),
          throwsA(isInstanceOf<UnexpectedValueError>()),
        );

        verifyNever(mockFirebaseAuth.signInWithEmailAndPassword(
          email: anyNamed("email"),
          password: anyNamed("password"),
        ));
      },
    );

    group('FirebaseAuthException cases', () {
      test(
        'Given user not found When sign in Then return InvalidEmailAndPasswordCombination',
        () async {
          when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).thenThrow(PlatformException(code: "user-not-found"));

          final result = await firebaseAuthFacade.signInWithEmailAndPassword(
            emailAddress: EmailAddress(validEmailString),
            password: Password(validPasswordString),
          );

          expect(result.isLeft(), isTrue);
          result.fold(
            (failure) {
              expect(failure, isA<InvalidEmailAndPasswordCombination>());
            },
            (_) {},
          );

          verify(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).called(1);
        },
      );

      test(
        'Given wrong password When sign in Then return InvalidEmailAndPasswordCombination',
        () async {
          when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).thenThrow(PlatformException(code: "wrong-password"));

          final result = await firebaseAuthFacade.signInWithEmailAndPassword(
            emailAddress: EmailAddress(validEmailString),
            password: Password(validPasswordString),
          );

          expect(result.isLeft(), isTrue);
          result.fold(
            (failure) {
              expect(failure, isA<InvalidEmailAndPasswordCombination>());
            },
            (_) {},
          );

          verify(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).called(1);
        },
      );

      test(
        'Given any other error When sign in Then return ServerError',
        () async {
          when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).thenThrow(PlatformException(code: "other code"));

          final result = await firebaseAuthFacade.signInWithEmailAndPassword(
            emailAddress: EmailAddress(validEmailString),
            password: Password(validPasswordString),
          );

          expect(result.isLeft(), isTrue);
          result.fold(
            (failure) {
              expect(failure, isA<ServerError>());
            },
            (_) {},
          );

          verify(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          )).called(1);
        },
      );
    });
  });

  group('Sign in with Google', () {
    test(
      'Given succesful sign in When process completes Then return Right(Unit)',
      () async {
        when(mockGoogleSignIn.signIn())
            .thenAnswer((_) async => mockGoogleSignInAccount);
        when(mockGoogleSignInAccount.authentication)
            .thenAnswer((_) async => mockGoogleSignInAuthentication);
        when(mockAuthProviderManager.getGoogleOAuthCredential(any))
            .thenReturn(mockOAuthCredential);
        when(mockFirebaseAuth.signInWithCredential(mockOAuthCredential))
            .thenAnswer((_) async => mockUserCredential);

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result.isRight(), isTrue);
        result.fold((_) {}, (value) {
          expect(value, unit);
        });

        verify(mockGoogleSignIn.signIn()).called(1);
        verify(mockGoogleSignInAccount.authentication).called(1);
        verify(mockAuthProviderManager.getGoogleOAuthCredential(any)).called(1);
        verify(mockFirebaseAuth.signInWithCredential(mockOAuthCredential))
            .called(1);
      },
    );

    test(
      'Given succesful sign in When user abort process Then return CancelledByUser',
      () async {
        when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result.isLeft(), isTrue);
        result.fold(
          (failure) {
            expect(failure, isA<CancelledByUser>());
          },
          (_) {},
        );

        verify(mockGoogleSignIn.signIn()).called(1);
        verifyNever(mockGoogleSignInAccount.authentication);
        verifyNever(mockAuthProviderManager.getGoogleOAuthCredential(any));
        verifyNever(mockFirebaseAuth.signInWithCredential(mockOAuthCredential));
      },
    );

    test(
      'Given unsuccesful sign in When FirebaseAuth.signInWithCredential() throws an exception Then return ServerError',
      () async {
        when(mockGoogleSignIn.signIn())
            .thenAnswer((_) async => mockGoogleSignInAccount);
        when(mockGoogleSignInAccount.authentication)
            .thenAnswer((_) async => mockGoogleSignInAuthentication);
        when(mockAuthProviderManager.getGoogleOAuthCredential(any))
            .thenReturn(mockOAuthCredential);
        when(mockFirebaseAuth.signInWithCredential(mockOAuthCredential))
            .thenThrow(PlatformException(code: "any code"));

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result.isLeft(), isTrue);
        result.fold(
          (failure) {
            expect(failure, isA<ServerError>());
          },
          (_) {},
        );

        verify(mockGoogleSignIn.signIn()).called(1);
        verify(mockGoogleSignInAccount.authentication).called(1);
        verify(mockAuthProviderManager.getGoogleOAuthCredential(any)).called(1);
        verify(mockFirebaseAuth.signInWithCredential(mockOAuthCredential))
            .called(1);
      },
    );
  });
}
