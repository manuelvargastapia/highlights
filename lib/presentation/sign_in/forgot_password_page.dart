import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/presentation/core/widgets/flush_bar_helper.dart';
import 'package:highlights/presentation/sign_in/widgets/forgot_password_form.dart';
import 'package:highlights/presentation/sign_in/widgets/password_reset_email_sent.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),
        ],
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: _authBlocListener,
          builder: (context, state) {
            return state.maybeWhen(
              passwordResetEmailSent: () => PasswordResetEmailSent(),
              orElse: () => ForgotPasswordForm(
                sendinPassworResetEmail: state.maybeWhen(
                  sendingPasswordResetEmail: () => true,
                  orElse: () => false,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    state.maybeWhen(
      passwordResetFailed: (failure) {
        failure.maybeWhen(
          userNotFound: () {
            FlushbarHelper.createError(
              context: context,
              message: 'No user associated to email',
            );
          },
          serverError: () {
            FlushbarHelper.createError(
              context: context,
              message: 'Internal server error',
            );
          },
          orElse: () {},
        );
      },
      orElse: () {},
    );
  }
}
