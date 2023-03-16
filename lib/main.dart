import 'package:flutter/material.dart';

import 'app/_.dart';
import 'settings/_.dart';

Future<void> main() async {
  await initApp();
  await initSettings();

  runApp(App());
}
