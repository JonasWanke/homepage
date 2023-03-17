import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/_.dart';
import 'settings/_.dart';

Future<void> main() async {
  usePathUrlStrategy();
  await initApp();
  await initSettings();

  runApp(App());
}
