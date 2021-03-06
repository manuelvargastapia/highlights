import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:another_flushbar/flushbar_helper.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/highlight_overview_scaffold.dart';
import 'package:highlights/presentation/routes/router.gr.dart';

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
                  message: state.failure.maybeMap(
                    insufficientPermission: (_) => 'Insufficient permissions.',
                    orElse: () =>
                        'Unexpected error occurred. Please contact support.',
                  ),
                ).show(context);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocProvider(
        create: (context) => getIt<HighlightWatcherBloc>()
          ..add(const HighlightWatcherEvent.watchAllStarted()),
        child: const HighlightOverviewScaffold(),
      ),
    );
  }
}
