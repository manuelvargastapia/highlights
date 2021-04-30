import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:highlights/presentation/core/widgets/core_text_form_field.dart';
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
    final screenSize = MediaQuery.of(context).size;

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: _authBlocListener,
        ),
        BlocListener<SignInFormBloc, SignInFormState>(
          listener: _signInFormListener,
        ),
      ],
      child: BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SizedBox(
              height: screenSize.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Image(
                      key: const Key('sign_in_top'),
                      image: const AssetImage('assets/sign_in_top.png'),
                      width: screenSize.width * 0.6,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 20,
                    child: Image(
                      key: const Key('sign_in_bottom'),
                      image: const AssetImage('assets/sign_in_bottom.png'),
                      width: screenSize.width * 0.6,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          _buildEmailField(context),
                          const SizedBox(height: 20),
                          _buildPasswordField(context),
                          const SizedBox(height: 2),
                          _buildForgotPasswordButton(context),
                          const SizedBox(height: 16),
                          _buildSignInAndRegisterButtons(context),
                          _buildGoogleButtonAndProgressIndicator(
                            context,
                            state,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    // TODO: little improvement: replace any "map"/"maybeMap" with
    // "when"/"maybeWhen" to get destructuring
    state.maybeWhen(
      emailVerificationSent: () {
        FlushbarHelper.createInformation(
          context: context,
          message: 'Check your inbox to verify your account',
        );
      },
      emailVerified: () {
        ExtendedNavigator.of(context).replace(Routes.highlightOverviewPage);

        context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
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
      orElse: () {},
    );
  }

  void _signInFormListener(BuildContext context, SignInFormState state) {
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
              message: 'Network connection failed. Check you internet status',
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
  }

  Widget _buildEmailField(BuildContext context) {
    return CoreTextFormField(
      key: const Key('email_field'),
      labelText: 'Email',
      prefixIcon: const Icon(Icons.email),
      autocorrect: false,
      onChanged: (value) {
        context.read<SignInFormBloc>().add(SignInFormEvent.emailChanged(value));
      },

      // Use state from bloc instead of buildder method,
      // because latter is delayed (it'll validate the
      // previous state instead of the current text inputed)
      validator: (_) =>
          context.read<SignInFormBloc>().state.emailAddress.value.fold(
                (failure) => failure.maybeMap(
                  invalidEmail: (_) => 'Invalid Email',
                  orElse: () => null,
                ),
                // If validator returns null, then any feedback is
                // provided to user because everithing is right
                (_) => null,
              ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return CoreTextFormField(
      key: const Key('password_field'),
      labelText: 'Password',
      prefixIcon: const Icon(Icons.lock),
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
                  shortPassword: (_) => 'Short Password', orElse: () => null),
              (_) => null),
    );
  }

  Widget _buildSignInAndRegisterButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            key: const Key('sign_in_button'),
            onPressed: () {
              // Trigger validation to display possible error messages
              _formKey.currentState.validate();

              context
                  .read<SignInFormBloc>()
                  .add(const SignInFormEvent.sigInWithEmailAndPasswordPessed());
            },
            child: const Text(
              'SIGN IN',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            key: const Key('register_button'),
            onPressed: () {
              _formKey.currentState.validate();
              context.read<SignInFormBloc>().add(
                    const SignInFormEvent.registerWithEmailAndPasswordPessed(),
                  );
            },
            child: const Text(
              'REGISTER',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          ExtendedNavigator.of(context).pushForgotPasswordPage();
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleButtonAndProgressIndicator(
    BuildContext context,
    SignInFormState state,
  ) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context
                .read<SignInFormBloc>()
                .add(const SignInFormEvent.sigInWithGooglePessed());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).primaryColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            elevation: MaterialStateProperty.all(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.google, size: 18),
              SizedBox(width: 8),
              Text(
                'SIGN IN WITH GOOGLE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        if (state.isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(),
        ],
      ],
    );
  }
}
