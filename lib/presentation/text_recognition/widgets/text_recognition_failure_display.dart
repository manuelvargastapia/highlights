import 'package:flutter/material.dart';

import 'package:highlights/domain/text_recognition/text_recognition_failure.dart';

class TextRecognitionFailureDisplay extends StatelessWidget {
  final TextRecognitionFailure failure;

  const TextRecognitionFailureDisplay({
    Key key,
    @required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 60),
      child: failure.when(
        unableToProcessImage: () => Column(
          children: const [
            Image(
              image: AssetImage('assets/unable_to_process_image.png'),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Continue with this image or try again.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        noTextDetected: () => Column(
          children: [
            const Image(
              image: AssetImage('assets/no_text_detected.png'),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: const [
                  Text(
                    "Couldn't recognize text.",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Continue with this image or try again.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
