import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:highlights/presentation/core/widgets/core_text_form_field.dart';

class ForgotPasswordForm extends StatelessWidget {
  /// This property must be `static` to avoid build loop
  ///
  /// See https://github.com/flutter/flutter/issues/20042
  ///
  // ignore: prefer_final_fields
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Quitar el "final" parece prevenir un error al cerrar sesión y volver al sign in, pero no está claro cómo o por qué

  final bool sendinPassworResetEmail;

  const ForgotPasswordForm({
    Key key,
    @required this.sendinPassworResetEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(context),
            _buildMessage(context),
            _buildEmailField(context),
            if (sendinPassworResetEmail) _buildProgressIndicator(),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Image(
        image: const AssetImage('assets/forgot_password.png'),
        height: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      children: [
        Text(
          'Forgot Password?',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            'Enter your registered email address. We will send you a link to reset your password',
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: CoreTextFormField(
        key: const Key('email_field'),
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
        autocorrect: false,
        onChanged: (value) {
          context
              .read<SignInFormBloc>()
              .add(SignInFormEvent.emailChanged(value));
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
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 18),
      child: LinearProgressIndicator(),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _formKey.currentState.validate();

            final emailAddress =
                context.read<SignInFormBloc>().state.emailAddress;

            if (emailAddress.isValid()) {
              BlocProvider.of<AuthBloc>(context).add(
                AuthEvent.passwordResetRequested(emailAddress),
              );
            }
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
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 40),
            ),
          ),
          child: const Text(
            'SEND LINK',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ExtendedNavigator.of(context).pop(context);
          },
          child: const Text(
            'CANCEL',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
