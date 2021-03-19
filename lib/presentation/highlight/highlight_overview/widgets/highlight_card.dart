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
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      highlight.bookTitle.getOrCrash(),
                      style: const TextStyle(fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'p. ${highlight.pageNumber.getOrCrash()}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    children: [
                      Material(
                        color: highlight.color.getOrCrash(),
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        child: const SizedBox(
                          width: 24,
                          height: 24,
                        ),
                      ),
                      if (highlight.image.isSome())
                        Column(
                          children: [
                            const SizedBox(height: 8),
                            Icon(
                              Icons.image,
                              size: 26,
                              color: Theme.of(context).backgroundColor,
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      highlight.quote.getOrCrash(),
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
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
