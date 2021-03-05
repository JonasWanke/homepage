import 'package:flutter/material.dart';

import 'app/module.dart';
import 'settings/module.dart';

Future<void> main() async {
  await initApp();
  await initSettings();

  runApp(App());
}
