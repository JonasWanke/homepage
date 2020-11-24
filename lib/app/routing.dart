import 'dart:html';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart' hide Route, Router;
import 'package:flutter_deep_linking/flutter_deep_linking.dart';

import 'utils.dart';
import 'widgets/app_bar.dart';

String get _domain => window.location.href.removePrefix('www.');
String webUrl(String path) => 'https://$_domain/$path';

final _hostRegExp = RegExp('(?:www\.)${RegExp.escape(_domain)}');

final router = Router(
  routes: [
    Route(
      matcher: Matcher.webHost(_hostRegExp, isOptional: true),
      routes: [],
    ),
    Route(materialBuilder: (_, result) => NotFoundPage(result.uri)),
  ],
);

class NotFoundPage extends StatelessWidget {
  const NotFoundPage(this.uri) : assert(uri != null);

  final Uri uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FancyAppBar(title: Text(context.s.app_error_pageNotFound)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Center(
          child: Text(
            context.s.app_error_pageNotFound_message(uri),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
