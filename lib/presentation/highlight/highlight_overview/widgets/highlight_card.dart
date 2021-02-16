import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/quote_info.dart';

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
          // TODO: navigate to HighlightForm passing highlight.imageUrl
        },
        onLongPress: () {
          // BlocProvider.of(context, listen: false) is needed --instead of
          // context.watch()-- to avoid the following error: "Tried to listen
          // to a value exposed with provider, from outside of the widget tree"
          final actorBloc = BlocProvider.of<HighlightActorBloc>(context);
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
              _InfoDisplay(info: highlight.info),
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
  final QuoteInfo info;

  const _InfoDisplay({
    Key key,
    @required this.info,
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
                info.bookTitle.getOrCrash(),
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
                info.pageNumber.getOrCrash().toString(),
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
