import 'package:flutter/material.dart';
import 'package:homepage/app/module.dart';
import 'package:homepage/settings/module.dart';

Future<void> main() async {
  await initApp();
  await initSettings();

  runApp(App());
}
