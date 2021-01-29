import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:dartz/dartz.dart';

import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/infrastructure/authentication/auth_provider_manager.dart';
import 'package:highlights/domain/authentication/user.dart';
import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:highlights/domain/core/errors.dart';

class MockFirebaseAuth extends Mock implements f.FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockUserCredential extends Mock implements f.UserCredential {}

class MockUser extends Mock implements f.User {
  @override
  String get uid {
    return "mock-uid";
  }
}

// ignore: avoid_implementing_value_types
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockOAuthCredential extends Mock implements f.OAuthCredential {}

class MockAuthProviderManager extends Mock implements AuthProviderManager {}

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  MockGoogleSignIn mockGoogleSignIn;
  MockUserCredential mockUserCredential;
  MockUser mockUser;
  MockGoogleSignInAccount mockGoogleSignInAccount;
  MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
  MockOAuthCredential mockOAuthCredential;
  MockAuthProviderManager mockAuthProviderManager;
  FirebaseAuthFacade firebaseAuthFacade;
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
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
      '\nGiven valid email and password\nWhen registering\nThen return Right(unit)',
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
      '\nGiven invalid email and password\nWhen registering\nThen throw UnexpectedValueError',
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
        '\nGiven email already in use\nWhen registering\nThen return EmailAlreadyInUse',
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
        '\nGiven email and password not enabled\nWhen registering\nThen return OperationNotAllowed',
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
        '\nGiven any other error\nWhen registering\nThen return ServerError',
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
      '\nGiven valid email and password\nWhen sign in\nThen return Right(unit)',
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
      '\nGiven invalid email and password\nWhen sign in\nThen throw UnexpectedValueError',
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
        '\nGiven user not found\nWhen sign in\nThen return InvalidEmailAndPasswordCombination',
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
        '\nGiven wrong password\nWhen sign in\nThen return InvalidEmailAndPasswordCombination',
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
        '\nGiven any other error\nWhen sign in\nThen return ServerError',
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
      '\nGiven succesful sign in\nWhen process completes\nThen return Right(Unit)',
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
      '\nGiven succesful sign in\nWhen user abort process\nThen return CancelledByUser',
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
      '\nGiven unsuccesful sign in\nWhen FirebaseAuth.signInWithCredential() throws an exception\nThen return ServerError',
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

  group('Get signed in User', () {
    test(
      '\nGiven authenticated User\nWhen fetching User\nThen return Some with User with Firebase User UID',
      () async {
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);

        final userOption = firebaseAuthFacade.getSignedInUser();

        expect(userOption.isSome(), isTrue);
        userOption.fold(
          () => {},
          (user) => expect(
            user,
            User(
              id: UniqueId.fromUniqueString("mock-uid"),
            ),
          ),
        );

        verify(mockFirebaseAuth.currentUser).called(1);
      },
    );

    test(
      '\nGiven unauthenticated User\nWhen fetching User\nThen return None',
      () async {
        when(mockFirebaseAuth.currentUser).thenReturn(null);

        final userOption = firebaseAuthFacade.getSignedInUser();

        expect(userOption.isNone(), isTrue);

        verify(mockFirebaseAuth.currentUser).called(1);
      },
    );
  });
}
