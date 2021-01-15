import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:highlights/domain/authentication/auth_failure.dart';
import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/domain/authentication/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(SignInFormState initialState, this._authFacade)
      : super(initialState);

  // TODO: determine if it's required
  //SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event) async* {
    throw UnimplementedError();
  }
}
