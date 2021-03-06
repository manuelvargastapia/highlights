import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:highlights/domain/authentication/user.dart';
import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';

class MockAuthFacade extends Mock implements IAuthFacade {}

class MockUser extends Mock implements User {}

void main() {
  MockAuthFacade mockAuthFacade;
  MockUser mockUser;

  setUp(() {
    mockAuthFacade = MockAuthFacade();
    mockUser = MockUser();
  });

  group('AuthCheckRequested', () {
    blocTest<AuthBloc, AuthState>(
      '\nGiven user authenticated'
      '\nWhen AuthCheckRequested ocurrs'
      '\nThen Authenticated is emitted',
      build: () {
        when(mockAuthFacade.getSignedInUser()).thenReturn(Some(mockUser));
        return AuthBloc(mockAuthFacade);
      },
      act: (bloc) => bloc.add(const AuthEvent.authCheckRequested()),
      expect: [const AuthState.authenticated()],
      verify: (_) {
        verify(mockAuthFacade.getSignedInUser()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      '\nGiven user unauthenticated'
      '\nWhen AuthCheckRequested ocurrs'
      '\nThen Unauthenticated is emitted',
      build: () {
        when(mockAuthFacade.getSignedInUser()).thenReturn(const None());
        return AuthBloc(mockAuthFacade);
      },
      act: (bloc) => bloc.add(const AuthEvent.authCheckRequested()),
      expect: [const AuthState.unauthenticated()],
      verify: (_) {
        verify(mockAuthFacade.getSignedInUser()).called(1);
      },
    );
  });
  group('SignedOut', () {
    blocTest<AuthBloc, AuthState>(
      '\nGiven user authenticated'
      '\nWhen SignedOut ocurrs'
      '\nThen Unauthenticated is emitted',
      build: () => AuthBloc(mockAuthFacade),
      act: (bloc) => bloc.add(const AuthEvent.signedOut()),
      expect: [const AuthState.unauthenticated()],
      verify: (_) {
        verify(mockAuthFacade.signOut()).called(1);
      },
    );
  });
}
