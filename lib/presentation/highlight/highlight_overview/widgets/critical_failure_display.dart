import 'package:flutter/material.dart';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:highlights/domain/highlights/highlight_failure.dart';

class CriticalFailureDisplay extends HookWidget {
  final HighlightFailure failure;

  const CriticalFailureDisplay({
    Key key,
    @required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailSended = useState(false);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            emailSended.value ? '😸' : '😱',
            style: const TextStyle(fontSize: 100),
          ),
          Text(
            emailSended.value
                ? 'Thanks for your report'
                : failure.maybeMap(
                    insufficientPermission: (_) => 'Insufficient permissions',
                    orElse: () => 'Unexpected error.\nPlease, contact support.',
                  ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          if (!emailSended.value)
            FlatButton(
              onPressed: () async {
                final Email email = Email(
                  body: 'Technical details:\n\n ${failure.toString()}',
                  subject: 'Highlights: Critical error report',
                  recipients: ['code@manuelvargas.dev'],
                );

                await FlutterEmailSender.send(email);

                emailSended.value = true;
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.mail),
                  SizedBox(width: 4),
                  Text('REPORT ERROR'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
