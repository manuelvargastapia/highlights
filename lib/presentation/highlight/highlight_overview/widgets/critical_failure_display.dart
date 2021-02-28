import 'package:flutter/material.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final HighlightFailure failure;

  const CriticalFailureDisplay({
    Key key,
    @required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '😱',
            style: TextStyle(fontSize: 100),
          ),
          Text(
            failure.maybeMap(
              // TODO: put texts in values
              insufficientPermission: (_) => 'Insufficient permissions',
              orElse: () => 'Unexpected error.\nPlease, contact support.',
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          FlatButton(
              onPressed: () {
                // TODO: implement or remove
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.mail),
                  SizedBox(width: 4),
                  Text('I NEED HELP'),
                ],
              )),
        ],
      ),
    );
  }
}
