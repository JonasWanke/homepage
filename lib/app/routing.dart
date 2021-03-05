import 'dart:html';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart' hide Route, Router;
import 'package:flutter_deep_linking/flutter_deep_linking.dart';

import 'pages/landing_page.dart';
import 'utils.dart';
import 'widgets/app_bar.dart';

String get domain => Uri.parse(window.location.href).host.removePrefix('www.');
String webUrl(String path) => 'https://$domain/$path';

final router = Router(
  routes: [
    Route(materialBuilder: (_, __) => LandingPage()),
    Route(materialBuilder: (_, result) => NotFoundPage(result.uri)),
  ],
);

class NotFoundPage extends StatelessWidget {
  const NotFoundPage(this.uri);

  final Uri uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FancyAppBar(title: Text(context.l10n.app_error_pageNotFound)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Center(
          child: Text(
            context.l10n.app_error_pageNotFound_message(uri),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
