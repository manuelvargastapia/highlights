import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';

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
            return ListView.builder(
              itemCount: state.highlights.size,
              itemBuilder: (context, index) {
                final highlight = state.highlights[index];
                if (highlight.failureOption.isSome()) {
                  return Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  );
                } else {
                  return Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                  );
                }
              },
            );
          },
          loadFailure: (state) {
            return Container(
              color: Colors.yellow,
              width: 200,
              height: 200,
            );
          },
        );
      },
    );
  }
}
