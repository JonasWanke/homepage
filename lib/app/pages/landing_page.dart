import 'package:flutter/gestures.dart';
import 'package:supernova_flutter/supernova_flutter.dart';

import '../../activities/_.dart';
import '../widgets/app_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final content = MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: context.mediaQuery.size.height / 6),
              _HelloWorldWidget(),
              const SizedBox(height: 64),
              Center(child: _ContactWidget()),
              SizedBox(height: context.mediaQuery.size.height / 6),
              Text(
                'What I do/did:',
                style: context.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const SliverActivities(),
      ],
    );
    return Scaffold(
      body: AdaptivePage(
        builder: (horizontalMargin) => CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: FancyAppBar()),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
              sliver: content,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3, 24, 3, 8),
                child: _Footer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HelloWorldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          _text("Hello, world! 👋 I'm\n"),
          const TextSpan(text: 'Jonas Wanke\n', style: TextStyle(fontSize: 56)),
          _text('and I develop '),
          _link(
            context,
            'open source projects',
            Uri.parse('https://github.com/JonasWanke'),
          ),
          _text(',\nmainly with Flutter and Rust.'),
        ],
      ),
      style: const TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}

class _ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Want to contact me? Don't hesitate :)",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ContactPossibility(Link.jonasTelegram),
            _ContactPossibility(Link.jonasEmail),
            _ContactPossibility(Link.jonasLinkedIn),
            _ContactPossibility(Link.jonasInstagram),
          ],
        ),
      ],
    );
  }
}

class _ContactPossibility extends StatelessWidget {
  const _ContactPossibility(this.link);

  final Link link;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async => tryLaunchingUrl(link.url),
      tooltip: link.tooltip,
      icon: SizedBox.square(dimension: 20, child: link.icon),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          _text(
            'Contact options are listed in preference order. This website '
            "doesn't use cookies, but feel free to ",
          ),
          _link(
            context,
            'buy me one',
            Uri.parse('https://gib.wanke.jetzt/1€'),
          ),
          _text(" 🍪. Made with ❤️ and Flutter. It's open source – "),
          _link(
            context,
            'the repository',
            Uri.parse('https://github.com/JonasWanke/homepage'),
          ),
          _text(' contains the source code and privacy policy.'),
        ],
      ),
      style: context.textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}

TextSpan _text(String text) => TextSpan(text: text);
TextSpan _link(BuildContext context, String text, Uri targetUrl) {
  return TextSpan(
    text: text,
    style: TextStyle(
      decoration: TextDecoration.underline,
      decorationColor:
          context.theme.scaffoldBackgroundColor.mediumEmphasisOnColor,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () async => tryLaunchingUrl(targetUrl),
  );
}
