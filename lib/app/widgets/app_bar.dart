import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:homepage/settings/module.dart';

import '../services.dart';

class FancyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FancyAppBar({this.title});

  final Widget title;

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: _buildBrightnessToggle(),
        ),
      ],
    );
  }

  Widget _buildBrightnessToggle() {
    return DayNightSwitcherIcon(
      isDarkModeEnabled: services.preferences.brightness.getValue().isDark,
      onStateChanged: (isDark) {
        final brightness = isDark ? Brightness.dark : Brightness.light;
        services.preferences.brightness.setValue(brightness);
      },
    );
  }
}
