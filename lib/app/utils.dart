import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

final logger = Logger(filter: ProductionFilter(), printer: SimplePrinter());
LoggingNavigatorObserver createLoggingNavigatorObserver() {
  return LoggingNavigatorObserver(
    logger: (message) => logger.d('Navigator: $message'),
  );
}

bool get isInDebugMode {
  var inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

/// Tries launching a url.
Future<bool> tryLaunchingUrl(Uri url) async {
  logger.i("Trying to launch url '$url'…");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    return true;
  }
  return false;
}
