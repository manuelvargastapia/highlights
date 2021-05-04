import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/domain/authentication/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.map(
      authCheckRequested: (event) async* {
        final userOption = _authFacade.getSignedInUser();
        yield userOption.fold(
          () => const AuthState.unauthenticated(),
          (user) => user.emailVerified
              ? const AuthState.authenticated()
              : const AuthState.unauthenticated(),
        );
      },
      emailVerificationRequested: (event) async* {
        final userOption = _authFacade.getSignedInUser();
        yield* userOption.fold(
          // In theory this never happen, and if it does, the UI simply would
          // do nothing
          () async* {
            yield const AuthState.unauthenticated();
          },
          (user) async* {
            if (user.emailVerified) {
              yield const AuthState.emailVerified();
            } else {
              // Intermediate state to prevent emitting the same more than one
              // time (otherwhise, no new state would be emitted because of
              // equality check)
              yield const AuthState.sendingEmailVerification();
              final failureOrUnit = await _authFacade.sendEmailVerification();
              yield failureOrUnit.fold(
                (failure) => AuthState.emailVerificationFailed(failure),
                (_) => const AuthState.emailVerificationSent(),
              );
            }
          },
        );
      },
      // TODO: test
      passwordResetRequested: (event) async* {
        yield const AuthState.sendingPasswordResetEmail();
        final failureOrUnit = await _authFacade.sendPasswordResetEmail(
          emailAddress: event.email,
        );
        yield failureOrUnit.fold(
          (failure) => AuthState.passwordResetFailed(failure),
          (_) => const AuthState.passwordResetEmailSent(),
        );
      },
      signedOut: (event) async* {
        await _authFacade.signOut();
        yield const AuthState.unauthenticated();
      },
    );
  }
}
