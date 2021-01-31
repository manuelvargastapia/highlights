import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flushbar/flushbar_helper.dart';

import 'package:highlights/application/authentication/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  /// This property must be `static` to avoid build loop
  ///
  /// See https://github.com/flutter/flutter/issues/20042
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        // Fold Option keeping possible failures and show notification in
        // case one is encountered
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => "Cancelled",
                  serverError: (_) => "Server Error",
                  invalidEmailAndPasswordCombination: (_) =>
                      "Invalid email and password combination",
                  emailAlreadyInUse: (_) => "Email already in use",

                  // TODO: remove this handler and treat it as "server error"
                  operationNotAllowed: (_) => "User blocked",
                ),
              ).show(context);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              const Icon(
                Icons.format_quote,
                size: 130,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                ),
                autocorrect: false,
                onChanged: (value) {
                  context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value));
                },

                // Use state from bloc instead of buildder method,
                // because latter is delayed (it'll validate the
                // previous state instead of the current text inputed)
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (failure) => failure.maybeMap(
                        invalidEmail: (_) => "Invalid Email",
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),

                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) {
                  context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.passwordChanged(value));
                },
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .password
                    .value
                    .fold(
                        (failure) => failure.maybeMap(
                            shortPassword: (_) => "Short Password",
                            orElse: () => null),
                        (_) => null),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        // Trigger validation to display possible error messages
                        _formKey.currentState.validate();

                        context.read<SignInFormBloc>().add(const SignInFormEvent
                            .sigInWithEmailAndPasswordPessed());
                      },
                      child: const Text("SIGN IN"),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        _formKey.currentState.validate();
                        context.read<SignInFormBloc>().add(const SignInFormEvent
                            .registerWithEmailAndPasswordPessed());
                      },
                      child: const Text("REGISTER"),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.sigInWithGooglePessed());
                },
                color: Colors.lightBlue,
                child: const Text(
                  "SIGN IN WITH GOOGLE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
