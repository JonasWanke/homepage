import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils.dart';
import '../widgets/app_bar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FancyAppBar(),
      body: Column(
        children: [
          Spacer(),
          Center(child: HelloWorldWidget()),
          SizedBox(height: 64),
          Center(child: ContactWidget()),
          Spacer(),
          Footer(),
        ],
      ),
    );
  }
}

class HelloWorldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: context.s.app_landingPage_helloWorld_prefix),
          TextSpan(text: 'Jonas Wanke\n', style: TextStyle(fontSize: 56)),
          TextSpan(text: context.s.app_landingPage_helloWorld_suffix),
        ],
      ),
      style: TextStyle(fontSize: 20),
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
          context.s.app_landingPage_contact,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContactPossibility(
              FontAwesomeIcons.telegramPlane,
              'Telegram',
              'https://t.me/JonasWanke',
            ),
            ContactPossibility(
              FontAwesomeIcons.whatsapp,
              'WhatsApp',
              'https://wa.me/+491626304343',
            ),
            ContactPossibility(
              Icons.mail_outline,
              'E-Mail',
              'mailto:contact+homepage@jonas-wanke.com',
            ),
            ContactPossibility(
              FontAwesomeIcons.linkedinIn,
              'LinkedIn',
              'https://linkedin.com/in/jonas-wanke',
            ),
            ContactPossibility(
              FontAwesomeIcons.instagram,
              'Instagram',
              'https://instagram.com/jonas.wanke',
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
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => tryLaunchingUrl(url),
      tooltip: name,
      icon: FaIcon(icon),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextSpan text(String text) => TextSpan(text: text);
    TextSpan link(String text, String targetUrl) {
      return TextSpan(
        text: text,
        style: TextStyle(decoration: TextDecoration.underline),
        recognizer: TapGestureRecognizer()
          ..onTap = () => tryLaunchingUrl(targetUrl),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text.rich(
        TextSpan(
          children: [
            text(context.s.app_landingPage_footer_text1),
            link(
              context.s.app_landingPage_footer_link1,
              'https://gib.wanke.jetzt/1€',
            ),
            text(context.s.app_landingPage_footer_text2),
            link(
              context.s.app_landingPage_footer_link2,
              'https://github.com/JonasWanke/homepage',
            ),
            text(context.s.app_landingPage_footer_text3),
          ],
        ),
        style: context.textTheme.caption,
        textAlign: TextAlign.center,
      ),
    );
  }
}
