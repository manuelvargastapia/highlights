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

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: emailSended.value ? 48 : 0),
        child: Column(
          children: [
            if (emailSended.value)
              const Image(image: AssetImage('assets/thank_you_report.png')),
            if (!emailSended.value) ...[
              const Image(image: AssetImage('assets/critical_failure.png')),
              const Text(
                'An error has ocurred! Please, consider sending a report.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextButton(
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
            ]
          ],
        ),
      ),
    );
  }
}
