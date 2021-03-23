import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';
import 'package:highlights/presentation/routes/router.gr.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/highlight_overview_body.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/filters_dialog/filters_bar.dart';

/// This Scaffold has been isolated as a Widget to allow proper UI testing.
///
/// If we keep this piece of UI in [HighlightOverviewPage], the UI testing will
/// require mocking the [HighlightWatcherBloc]. But this isn't possible without
/// creating the bloc up in the Widget-tree, which causes a problem because
/// the bloc would never be closed. We need to split the UI  into more specific
/// Widgets to test them separately, each one depending on a few blocs previously
/// created right before inserting the Widget in the tree.
class HighlightOverviewScaffold extends StatelessWidget {
  const HighlightOverviewScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Highlights'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.signedOut());
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => getIt<HighlightFiltererBloc>(),
            child: FiltersBar(),
          ),
          Expanded(child: HighlightOverviewBody()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.of(context).pushHighlightFormPage();
        },
        child: const Icon(Icons.add, size: 36),
      ),
    );
  }
}
