import 'package:homepage/app/module.dart';
import 'preferences.dart';
export 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

export 'preferences.dart';

Future<void> initSettings() async {
  services.registerSingletonAsync(Preferences.create);
}
