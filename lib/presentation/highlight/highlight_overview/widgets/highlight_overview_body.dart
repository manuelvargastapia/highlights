import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/critical_failure_display.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/error_highlight_card.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/highlight_card.dart';

class HighlightOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightWatcherBloc, HighlightWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            if (state.highlights.isEmpty()) {
              return const Center(child: Text('NO HIGHLIGHTS'));
            }
            return ListView.builder(
              itemCount: state.highlights.size,
              itemBuilder: (context, index) {
                final highlight = state.highlights[index];
                if (highlight.failureOption.isSome()) {
                  return ErrorHighlightCard(highlight: highlight);
                } else {
                  return HighlightCard(highlight: highlight);
                }
              },
            );
          },
          loadFailure: (state) {
            return CriticalFailureDisplay(failure: state.failure);
          },
        );
      },
    );
  }
}
