import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:homepage/generated/l10n.dart';
import 'package:homepage/settings/module.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../routing.dart';
import '../services.dart';
import '../utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<ThemeMode>(
      preference: services.preferences.themeMode,
      builder: (context, themeMode) {
        return MaterialApp(
          title: 'Jonas Wanke',
          theme: _createTheme(Brightness.light),
          darkTheme: _createTheme(Brightness.dark),
          themeMode: themeMode,
          onGenerateRoute: router.onGenerateRoute,
          navigatorObservers: [createLoggingNavigatorObserver()],
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}

ThemeData _createTheme(Brightness brightness) {
  return ThemeData(brightness: brightness);
}
