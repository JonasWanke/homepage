import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:supernova_flutter/supernova_flutter.dart';

import '../../settings/_.dart';

class FancyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FancyAppBar({this.title});

  final Widget? title;

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
          child: _buildBrightnessToggle(context),
        ),
      ],
    );
  }

  Widget _buildBrightnessToggle(BuildContext context) {
    return DayNightSwitcherIcon(
      isDarkModeEnabled: services.preferences.brightness.getValue().isDark,
      onStateChanged: (isDark) async {
        final brightness = isDark ? Brightness.dark : Brightness.light;
        await services.preferences.brightness.setValue(brightness);
      },
      nightBackgroundColor: context.theme.scaffoldBackgroundColor,
    );
  }
}
