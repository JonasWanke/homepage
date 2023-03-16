import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils.dart';
import '../widgets/app_bar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FancyAppBar(),
      body: Column(children: [
        const Spacer(),
        Center(child: HelloWorldWidget()),
        const SizedBox(height: 64),
        Center(child: ContactWidget()),
        const Spacer(),
        Footer(),
      ]),
    );
  }
}

class HelloWorldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        _text(context.l10n.app_landingPage_helloWorld_prefix),
        const TextSpan(text: 'Jonas Wanke\n', style: TextStyle(fontSize: 56)),
        _text(context.l10n.app_landingPage_helloWorld_suffix_text1),
        _link(
          context,
          context.l10n.app_landingPage_helloWorld_suffix_link1,
          Uri.parse('https://github.com/JonasWanke'),
        ),
        _text(context.l10n.app_landingPage_helloWorld_suffix_text2),
      ]),
      style: const TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.app_landingPage_contact,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContactPossibility(
              FontAwesomeIcons.telegram,
              'Telegram',
              Uri.parse('https://t.me/JonasWanke'),
            ),
            ContactPossibility(
              Icons.mail_outline,
              'E-Mail',
              Uri.parse('mailto:contact+homepage@jonas-wanke.com'),
            ),
            ContactPossibility(
              FontAwesomeIcons.linkedinIn,
              'LinkedIn',
              Uri.parse('https://linkedin.com/in/jonas-wanke'),
            ),
            ContactPossibility(
              FontAwesomeIcons.instagram,
              'Instagram',
              Uri.parse('https://instagram.com/jonas.wanke'),
            ),
            // ContactPossibility(
            //   FontAwesomeIcons.twitter,
            //   'Twitter',
            //   'https://twitter.com/JonasWanke',
            // ),
          ],
        ),
      ],
    );
  }
}

class ContactPossibility extends StatelessWidget {
  const ContactPossibility(this.icon, this.name, this.url);

  final IconData icon;
  final String name;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async => tryLaunchingUrl(url),
      tooltip: name,
      icon: FaIcon(icon),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text.rich(
        TextSpan(children: [
          _text(context.l10n.app_landingPage_footer_text1),
          _link(
            context,
            context.l10n.app_landingPage_footer_link1,
            Uri.parse('https://gib.wanke.jetzt/1€'),
          ),
          _text(context.l10n.app_landingPage_footer_text2),
          _link(
            context,
            context.l10n.app_landingPage_footer_link2,
            Uri.parse('https://github.com/JonasWanke/homepage'),
          ),
          _text(context.l10n.app_landingPage_footer_text3),
        ]),
        style: context.textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
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
