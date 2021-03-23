import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class PasswordResetEmailSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(context),
        _buildMessage(context),
        const SizedBox(height: 48),
        _buildActionButton(context),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Image(
        image: const AssetImage('assets/email_sent.png'),
        height: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      children: [
        Text(
          'Check your inbox',
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
            'We have sent you the password recover instructions to your email',
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

  Widget _buildActionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ExtendedNavigator.of(context).pop(context);
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
        'BACK TO SIGN IN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
