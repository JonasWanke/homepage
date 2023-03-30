import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';

import '../../settings/_.dart';
import '../routing.dart';
import '../services.dart';
import '../utils.dart';
import 'konami_wrapper.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder(
      preference: services.preferences.brightness,
      builder: (context, brightness) => KonamiWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jonas Wanke',
          theme: createTheme(Brightness.light),
          darkTheme: createTheme(Brightness.dark),
          themeMode: brightness.isLight ? ThemeMode.light : ThemeMode.dark,
          onGenerateRoute: router.onGenerateRoute,
          navigatorObservers: [createLoggingNavigatorObserver()],
        ),
      ),
    );
  }

  static ThemeData createTheme(Brightness brightness) {
    const primaryColor = Colors.green;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primaryColor,
        backgroundColor:
            primaryColor.withOpacity(0.02).alphaBlendOn(brightness.color),
        brightness: brightness,
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(color: brightness.mediumEmphasisOnColor),
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(cardBorderRadius)),
        ),
      ),
    );
  }
}
