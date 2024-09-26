import 'package:supernova_flutter/supernova_flutter.dart';

import 'app/_.dart';
import 'settings/_.dart';

Future<void> main() async {
  await initSupernova(shouldInitializeTimeMachine: false);

  initSettings();

  runApp(const App());
}
