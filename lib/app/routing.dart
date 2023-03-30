import 'package:flutter/material.dart' hide Route, Router;
import 'package:flutter_deep_linking/flutter_deep_linking.dart';

import 'pages/landing_page.dart';
import 'widgets/app_bar.dart';

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
      appBar: const FancyAppBar(title: Text('Page not found')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Center(
          child: Text(
            "404 – We couldn't find the page you were looking for:\n$uri",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
