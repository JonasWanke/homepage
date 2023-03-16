import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';

import '../../settings/module.dart';
import '../routing.dart';
import '../services.dart';
import '../utils.dart';
import 'konami_wrapper.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<Brightness>(
      preference: services.preferences.brightness,
      builder: (context, brightness) => KonamiWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jonas Wanke',
          theme: _createTheme(Brightness.light),
          darkTheme: _createTheme(Brightness.dark),
          themeMode: brightness.isLight ? ThemeMode.light : ThemeMode.dark,
          onGenerateRoute: router.onGenerateRoute,
          navigatorObservers: [createLoggingNavigatorObserver()],
        ),
      ),
    );
  }
}

ThemeData _createTheme(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    applyElevationOverlayColor: true,
  );
}
