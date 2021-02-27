import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/presentation/routes/router.gr.dart';

class HighlightCard extends StatelessWidget {
  final Highlight highlight;

  const HighlightCard({
    Key key,
    @required this.highlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: highlight.color.getOrCrash(),
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context).pushHighlightFormPage(
            editedHighlight: highlight,
          );
        },
        onLongPress: () {
          // BlocProvider.of(context, listen: false) is needed --instead of
          // context.watch()-- to avoid the following error: "Tried to listen
          // to a value exposed with provider, from outside of the widget tree"
          final actorBloc = context.read<HighlightActorBloc>();
          _showDeletionDialog(context, actorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                highlight.quote.getOrCrash(),
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              _InfoDisplay(
                bookTitle: highlight.bookTitle,
                pageNumber: highlight.pageNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeletionDialog(
    BuildContext context,
    HighlightActorBloc actorBloc,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected highlight: '),
          content: Text(
            highlight.quote.getOrCrash(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            FlatButton(
              onPressed: () {
                actorBloc.add(HighlightActorEvent.deleted(highlight));
                Navigator.pop(context);
              },
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }
}

// TODO: consider putting some metadata (ex: color) into entities
// IDEA: use Chips as tags to filter or cathegorize highlights
class _InfoDisplay extends StatelessWidget {
  final BookTitle bookTitle;
  final QuotePage pageNumber;

  const _InfoDisplay({
    Key key,
    @required this.bookTitle,
    @required this.pageNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Book title:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 4),
            Chip(
              label: Text(
                bookTitle.getOrCrash(),
                style: const TextStyle(fontSize: 14),
              ),
              backgroundColor: Colors.yellow,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Page:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 4),
            Chip(
              label: Text(
                pageNumber.getOrCrash().toString(),
                style: const TextStyle(fontSize: 14),
              ),
              backgroundColor: Colors.lightGreen,
            ),
          ],
        ),
      ],
    );
  }
}
