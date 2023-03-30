import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'brand_icon.dart';

class Link {
  const Link.article(this.url, this.tooltip)
      : icon = const Icon(Icons.article_outlined);
  const Link.competitionResults(this.url, this.tooltip)
      : icon = const Icon(FontAwesomeIcons.award);
  Link.facebook(String pageName)
      : icon = BrandIcon.facebook.widget,
        url = Uri.https('facebook.com', '/$pageName'),
        tooltip = 'View on Facebook';
  Link.gitHub(String owner, String repo)
      : icon = const Icon(FontAwesomeIcons.github),
        url = Uri.https('github.com', '/$owner/$repo'),
        tooltip = 'View on GitHub';
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
  const Link.newspaperArticle(String newspaperName, this.url)
      : icon = const Icon(Icons.article_outlined),
        tooltip = 'Read an article in the newspaper “$newspaperName”';
  Link.pubDev(String packageName)
      : icon = BrandIcon.dart.widget,
        url = Uri.https('pub.dev', '/packages/$packageName'),
        tooltip = 'View on pub.dev';
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
}
