import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/presentation/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection();
  runApp(AppWidget());
}
