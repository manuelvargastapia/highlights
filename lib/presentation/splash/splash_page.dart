import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/presentation/routes/router.gr.dart';

/// Initial page responsible for authetication validations for routing
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          authenticated: (_) {
            ExtendedNavigator.of(context).replace(Routes.highlightOverviewPage);
          },
          unauthenticated: (_) {
            ExtendedNavigator.of(context).replace(Routes.signInPage);
          },
          // Ignore initial and email verification states in this point
          orElse: () {},
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
