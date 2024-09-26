import '../app/_.dart';
import 'preferences.dart';

export 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

export 'preferences.dart';

void initSettings() {
  services.registerSingletonAsync(Preferences.create);
}
