import 'package:flutter/material.dart';

import 'package:another_flushbar/flushbar.dart';

/// Custom Flushbar helper.
///
/// It receives a [BuildContext] to set up properties and call show()
/// automatically.
class FlushbarHelper {
  static void createInformation({
    @required BuildContext context,
    @required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _createFlushbar(
      context,
      message,
      duration,
      Icon(
        Icons.info_outline,
        size: 28.0,
        color: Theme.of(context).accentColor,
      ),
      Theme.of(context).accentColor,
    ).show(context);
  }

  static void createError({
    @required BuildContext context,
    @required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _createFlushbar(
      context,
      message,
      duration,
      Icon(
        Icons.warning,
        size: 28.0,
        color: Theme.of(context).errorColor,
      ),
      Theme.of(context).errorColor,
    ).show(context);
  }
}

Flushbar _createFlushbar(
  BuildContext context,
  String message,
  Duration duration,
  Icon icon,
  Color leftBarIndicatorColor,
) {
  return Flushbar(
    duration: duration,
    icon: icon,
    backgroundColor: Theme.of(context).backgroundColor,
    borderRadius: 32,
    padding: const EdgeInsets.all(18),
    margin: const EdgeInsets.all(16),
    shouldIconPulse: false,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    messageText: Text(
      message,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
