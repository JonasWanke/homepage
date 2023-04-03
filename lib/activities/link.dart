import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'brand_icon.dart';

class Link {
  const Link.article(this.url, this.tooltip)
      : icon = const Icon(Icons.article_outlined);
  const Link.competitionResults(this.url, this.tooltip)
      : icon = const FaIcon(FontAwesomeIcons.award);
  Link.email(String emailAddress)
      : icon = const Icon(Icons.mail_outline),
        url = Uri.parse('mailto:$emailAddress'),
        tooltip = 'Write an E-Mail';
  Link.facebook(String pageName)
      : icon = BrandIcon.facebook.widget,
        url = Uri.https('facebook.com', '/$pageName'),
        tooltip = 'View on Facebook';
  Link.gitHubUser(String user)
      : icon = const FaIcon(FontAwesomeIcons.github),
        url = Uri.https('github.com', '/$user'),
        tooltip = 'View user on GitHub';
  Link.gitHubRepository(String owner, String repo)
      : icon = const FaIcon(FontAwesomeIcons.github),
        url = Uri.https('github.com', '/$owner/$repo'),
        tooltip = 'View repository on GitHub';
  Link.googlePlay(String applicationId)
      : icon = BrandIcon.googlePlay.widget,
        url = Uri.https(
          'play.google.com',
          '/store/apps/details?id=$applicationId',
        ),
        tooltip = 'View on Google Play';
  const Link.homepage(this.url)
      : icon = const Icon(Icons.web_outlined),
        tooltip = 'Open homepage';
  Link.instagram(String username)
      : icon = BrandIcon.instagram.widget,
        url = Uri.https('instagram.com', '/$username'),
        tooltip = 'View on Instagram';
  Link.linkedIn(String username)
      : icon = const FaIcon(FontAwesomeIcons.linkedin),
        url = Uri.https('linkedin.com', '/in/$username'),
        tooltip = 'View on LinkedIn';
  const Link.newspaperArticle(String newspaperName, this.url)
      : icon = const Icon(Icons.article_outlined),
        tooltip = 'Read an article in the newspaper “$newspaperName”';
  Link.pubDev(String packageName)
      : icon = BrandIcon.dart.widget,
        url = Uri.https('pub.dev', '/packages/$packageName'),
        tooltip = 'View on pub.dev';
  Link.telegram(String username)
      : icon = const FaIcon(FontAwesomeIcons.telegram),
        url = Uri.https('t.me', '/$username'),
        tooltip = 'Contact on Telegram';
  Link.twitter(String username)
      : icon = BrandIcon.twitter.widget,
        url = Uri.https('twitter.com', '/$username'),
        tooltip = 'View on Twitter';
  Link.youTubeChannel(String handle)
      : icon = BrandIcon.youTube.widget,
        url = Uri.https('youtube.com', '/@$handle'),
        tooltip = 'View channel on YouTube';
  Link.youTubeVideo(String id, this.tooltip)
      : icon = BrandIcon.youTube.widget,
        url = Uri.https('youtube.com', '/watch', {'v': id});
  const Link.other(this.icon, this.url, this.tooltip);

  final Widget icon;
  final Uri url;
  final String tooltip;

  static final jonasEmail = Link.email('contact-homepage@jonas-wanke.com');
  static final jonasGitHub = Link.gitHubUser('JonasWanke');
  static final jonasInstagram = Link.instagram('jonas.wanke');
  static final jonasLinkedIn = Link.linkedIn('jonas-wanke');
  static final jonasTelegram = Link.telegram('JonasWanke');
}
