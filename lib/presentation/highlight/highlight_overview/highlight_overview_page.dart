import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';

import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/highlight_overview_body.dart';
import 'package:highlights/presentation/routes/router.gr.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';

class HighlightOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeMap(
              unauthenticated: (_) {
                ExtendedNavigator.of(context).replace(Routes.signInPage);
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<HighlightActorBloc, HighlightActorState>(
          listener: (context, state) {
            state.maybeMap(
              deleteFailure: (state) {
                FlushbarHelper.createError(
                  duration: const Duration(seconds: 5),
                  message: state.failure.map(
                    unexpected: (_) =>
                        'Unexpected error occurred while deleting. Please contact support.',
                    insufficientPermission: (_) => 'Insufficient permissions.',
                    // This error is never going to happen, because this case is only handling deleting, not updating
                    unableToUpdate: (_) =>
                        'Unexpected error occurred while deleting. Please contact support.',
                  ),
                ).show(context);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Highlights'),
          leading: IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.signedOut());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // TODO: implement filtering
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: HighlightOverviewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: navigate to Highlight form page
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
