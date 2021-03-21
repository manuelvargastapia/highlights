import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:animations/animations.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/domain/authentication/value_objects.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:highlights/presentation/core/widgets/flush_bar_helper.dart';
import 'package:highlights/presentation/routes/router.gr.dart';

class SignInForm extends StatelessWidget {
  /// This property must be `static` to avoid build loop
  ///
  /// See https://github.com/flutter/flutter/issues/20042
  ///
  // ignore: prefer_final_fields
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Quitar el "final" parece prevenir un error al cerrar sesión y volver al sign in, pero no está claro cómo o por qué

  // TODO: update tests
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: little improvement: replace any "map"/"maybeMap" with
            // "when"/"maybeWhen" to get destructuring
            state.maybeWhen(
              emailVerificationSent: () {
                FlushbarHelper.createInformation(
                  context: context,
                  message: 'Check your inbox to verify your account',
                );
              },
              passwordResetEmailSent: () {
                FlushbarHelper.createInformation(
                  context: context,
                  message: 'Check your inbox to recover your password',
                );
              },
              emailVerified: () {
                ExtendedNavigator.of(context)
                    .replace(Routes.highlightOverviewPage);

                context
                    .read<AuthBloc>()
                    .add(const AuthEvent.authCheckRequested());
              },
              emailVerificationFailed: (failure) {
                failure.maybeWhen(
                  serverError: () {
                    FlushbarHelper.createError(
                      context: context,
                      message: 'Internal server error',
                    );
                  },
                  tooManyRequests: () {
                    FlushbarHelper.createInformation(
                      context: context,
                      message: 'Plase, check your inbox to validate your email',
                    );
                  },
                  orElse: () {},
                );
              },
              passwordResetFailed: (failure) {
                failure.maybeWhen(
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
          },
        ),
        BlocListener<SignInFormBloc, SignInFormState>(
          listener: (context, state) {
            // Fold Option keeping possible failures and show notification in
            // case one is encountered
            state.authFailureOrSuccessOption.fold(
              // Do nothing when authFailureOrSuccessOption is none(), becuase
              // that means that nothing has happened yet
              () {},
              (failureOrUnit) => failureOrUnit.fold(
                (failure) {
                  failure.maybeWhen(
                    // Don't show a notification for cancelledByUser and tooManyRequests
                    cancelledByUser: () {},
                    tooManyRequests: () {},
                    networkConnectionFailed: () => FlushbarHelper.createError(
                      context: context,
                      message:
                          'Network connection failed. Check you internet status',
                    ),
                    emailAlreadyInUse: () => FlushbarHelper.createError(
                      context: context,
                      message: 'Email already in use',
                    ),
                    invalidEmailAndPasswordCombination: () =>
                        FlushbarHelper.createError(
                      context: context,
                      message: 'Invalid email and password combination',
                    ),
                    // operationNotAllowed is considered an internal server error
                    orElse: () => FlushbarHelper.createError(
                      context: context,
                      message: 'Internal server error',
                    ),
                  );
                },
                (_) {
                  context
                      .read<AuthBloc>()
                      .add(const AuthEvent.emailVerificationRequested());
                },
              ),
            );
          },
        ),
      ],
      child: BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                const Icon(
                  Icons.format_quote,
                  size: 130,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: const Key('email_field'),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
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
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null,
                        ),
                        // If validator returns null, then any feedback is
                        // provided to user because everithing is right
                        (_) => null,
                      ),

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: const Key('password_field'),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
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
                              shortPassword: (_) => 'Short Password',
                              orElse: () => null),
                          (_) => null),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        key: const Key('sign_in_button'),
                        onPressed: () {
                          // Trigger validation to display possible error messages
                          _formKey.currentState.validate();

                          context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .sigInWithEmailAndPasswordPessed());
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        key: const Key('register_button'),
                        onPressed: () {
                          _formKey.currentState.validate();
                          context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPessed());
                        },
                        child: const Text('REGISTER'),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<SignInFormBloc>()
                        .add(const SignInFormEvent.sigInWithGooglePessed());
                  },
                  child: const Text(
                    'SIGN IN WITH GOOGLE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ],
                const SizedBox(height: 64),
                TextButton(
                  onPressed: () async {
                    final emailAddress = await showModal<EmailAddress>(
                      context: context,
                      configuration: const FadeScaleTransitionConfiguration(
                        transitionDuration: Duration(milliseconds: 300),
                        reverseTransitionDuration: Duration(milliseconds: 300),
                      ),
                      builder: (context) {
                        final passwordResetFormKey = GlobalKey<FormState>();

                        return BlocProvider(
                          create: (context) => getIt<SignInFormBloc>(),
                          child: BlocBuilder<SignInFormBloc, SignInFormState>(
                            builder: (context, state) {
                              return AlertDialog(
                                title: const Text('Input your email'),
                                content: Form(
                                  key: passwordResetFormKey,
                                  child: TextFormField(
                                    autocorrect: false,
                                    onChanged: (value) {
                                      context.read<SignInFormBloc>().add(
                                          SignInFormEvent.emailChanged(value));
                                    },
                                    validator: (_) => context
                                        .read<SignInFormBloc>()
                                        .state
                                        .emailAddress
                                        .value
                                        .fold(
                                          (failure) => failure.maybeMap(
                                            invalidEmail: (_) =>
                                                'Invalid Email',
                                            orElse: () => null,
                                          ),
                                          // If validator returns null, then any feedback is
                                          // provided to user because everithing is right
                                          (_) => null,
                                        ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('CANCEL'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      passwordResetFormKey.currentState
                                          .validate();

                                      if (state.emailAddress.isValid()) {
                                        Navigator.pop(
                                          context,
                                          state.emailAddress,
                                        );
                                      }
                                    },
                                    child: const Text('SEND EMAIL'),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );

                    if (emailAddress != null) {
                      BlocProvider.of<AuthBloc>(context)
                          .add(AuthEvent.passwordResetRequested(emailAddress));
                    }
                  },
                  child: const Text('Forot password?'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
