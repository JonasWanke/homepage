import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:supernova_flutter/supernova_flutter.dart';

class Preferences {
  Preferences._(StreamingSharedPreferences sharedPreferences)
      : brightness = sharedPreferences.getCustomValue(
          'brightness',
          defaultValue:
              SchedulerBinding.instance.platformDispatcher.platformBrightness,
          adapter: _BrightnessAdapter(),
        );
  static Future<Preferences> create() async =>
      Preferences._(await StreamingSharedPreferences.instance);

  final Preference<Brightness> brightness;
}

extension PreferencesGetIt on GetIt {
  Preferences get preferences => get<Preferences>();
}

class _BrightnessAdapter extends PreferenceAdapter<Brightness> {
  @override
  Brightness? getValue(SharedPreferences preferences, String key) {
    final value = preferences.getString(key);
    return switch (value) {
      'light' => Brightness.light,
      'dark' => Brightness.dark,
      _ => null,
    };
  }

  @override
  Future<bool> setValue(
    SharedPreferences preferences,
    String key,
    Brightness value,
  ) {
    final string = switch (value) {
      Brightness.light => 'light',
      Brightness.dark => 'dark',
    };
    return preferences.setString(key, string);
  }
}
