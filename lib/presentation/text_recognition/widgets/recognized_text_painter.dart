import 'package:flutter/material.dart';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/text_recognition/text_recognition_result.dart';

class RecognizedTextPainter extends CustomPainter {
  final TextRecognitionResult _result;

  RecognizedTextPainter(this._result);

  @override
  void paint(Canvas canvas, Size size) {
    final imageSize = _result.imageSize
        .getOrElse(() => throw UnexpectedUIError())
        .getOrCrash();

    final double scaleX = size.width / imageSize.width;
    final double scaleY = size.height / imageSize.height;

    Rect scaleRect(TextContainer container) {
      return Rect.fromLTRB(
        container.boundingBox.left * scaleX,
        container.boundingBox.top * scaleY,
        container.boundingBox.right * scaleX,
        container.boundingBox.bottom * scaleY,
      );
    }

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 1;

    final elements = _result.recognizedElements.getOrCrash();

    elements.asList().forEach((element) {
      final rect = scaleRect(element.getOrCrash());
      canvas.drawRect(rect, paint);
    });
  }

  @override
  bool shouldRepaint(RecognizedTextPainter oldDelegate) {
    return true;
  }
}
