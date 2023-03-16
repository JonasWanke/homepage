import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Preferences {
  Preferences._(StreamingSharedPreferences sharedPreferences)
      : brightness = sharedPreferences.getCustomValue(
          'brightness',
          defaultValue: SchedulerBinding.instance.window.platformBrightness,
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
    return {
      'light': Brightness.light,
      'dark': Brightness.dark,
    }[preferences.getString(key)];
  }

  @override
  Future<bool> setValue(
    SharedPreferences preferences,
    String key,
    Brightness value,
  ) {
    final string = {
      Brightness.light: 'light',
      Brightness.dark: 'dark',
    }[value]!;
    return preferences.setString(key, string);
  }
}
