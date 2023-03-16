import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

final logger = Logger(filter: ProductionFilter(), printer: SimplePrinter());
LoggingNavigatorObserver createLoggingNavigatorObserver() {
  return LoggingNavigatorObserver(
    logger: (message) => logger.d('Navigator: $message'),
  );
}

extension ContextWithLocalization on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

typedef L10nStringGetter = String Function(AppLocalizations);

bool get isInDebugMode {
  var inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

/// Tries launching a url.
Future<bool> tryLaunchingUrl(String url) async {
  logger.i("Trying to launch url '$url'…");

  if (await canLaunch(url)) {
    await launch(url);
    return true;
  }
  return false;
}
