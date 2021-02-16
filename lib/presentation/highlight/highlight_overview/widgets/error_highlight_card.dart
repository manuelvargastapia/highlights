import 'package:flutter/material.dart';
import 'package:highlights/domain/highlights/highlight.dart';

class ErrorHighlightCard extends StatelessWidget {
  final Highlight highlight;

  const ErrorHighlightCard({
    Key key,
    @required this.highlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).errorColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Invalid Highlight. Please, contact support',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyText2
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'Details for nerds:',
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            Text(
              highlight.failureOption.fold(
                // "ifNone" case must be handled but actually it'll never happen
                // because this Widget is rendered only when a failure is found
                () => '',
                (f) => f.toString(),
              ),
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
