import 'package:supernova_flutter/supernova_flutter.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({this.isFullwidth = false, required this.builder});

  static const navigationDrawerWidth = 256.0;
  static const _breakpointS = 600.0;
  static const _marginXs = 16.0;
  static const _marginS = 32.0;
  static const _marginMax = 200.0;

  final bool isFullwidth;
  final AdaptivePageBodyBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      // https://m3.material.io/foundations/adaptive-design/large-screens/layout-anatomy
      final double horizontalMargin;
      if (width < _breakpointS) {
        horizontalMargin = _marginXs;
      } else if (width <= _breakpointS + 2 * (_marginS - _marginXs)) {
        horizontalMargin = width.mapRange(
          _breakpointS,
          _breakpointS + 2 * (_marginS - _marginXs),
          _marginXs,
          _marginS,
        );
      } else if (isFullwidth ||
          width < navigationDrawerWidth + _marginS + 840 + _marginS) {
        horizontalMargin = _marginS;
      } else if (width <
          navigationDrawerWidth + _marginMax + 840 + _marginMax) {
        horizontalMargin = width.mapRange(
          navigationDrawerWidth + _marginS + 840 + _marginS,
          navigationDrawerWidth + _marginMax + 840 + _marginMax,
          _marginS,
          _marginMax,
        );
      } else {
        horizontalMargin = _marginMax;
      }

      return builder(horizontalMargin);
    });
  }
}

typedef AdaptivePageBodyBuilder = Widget Function(double horizontalMargin);
