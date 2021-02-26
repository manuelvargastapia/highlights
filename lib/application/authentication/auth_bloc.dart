import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/authentication/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

// TODO: NO NEW DOCUMENTS CREATED IN FIRESTORE FOR NEW USERS
// TODO: USERS CAN VIEW DOCS FROM OTHERS

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
          (_) => const AuthState.authenticated(),
        );
      },
      signedOut: (event) async* {
        await _authFacade.signOut();
        yield const AuthState.unauthenticated();
      },
    );
  }
}
