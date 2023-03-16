import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

const pageHorizontalPadding = 32.0;

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

extension SetExtension<T> on Set<T> {
  Set<T> addImmutable(T item) => Set.of(this)..add(item);
  Set<T> removeImmutable(T item) => Set.of(this)..remove(item);
}
