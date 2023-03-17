import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app/_.dart';
import 'brand_icon.dart';
import 'local_month.dart';
import 'tag.dart';

part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  const factory Activity(
    String title,
    ActivityType type, {
    @Default(false) bool isHighlight,
    required LocalMonth start,
    LocalMonth? end,
    required String? description,
    required Set<Tag> tags,
    required Set<Link> links,
  }) = _Activity;
  const Activity._();

  bool get isOngoing => end == null;
}

enum ActivityType {
  education('Education'),
  work('Work'),
  volunteering('Volunteering'),
  competition('Competition'),
  project('Project');

  const ActivityType(this.title);

  final String title;

  Color get color {
    switch (this) {
      case ActivityType.competition:
        return Colors.purple;
      case ActivityType.education:
        return Colors.green;
      case ActivityType.project:
        return Colors.yellow;
      case ActivityType.volunteering:
        return Colors.orange;
      case ActivityType.work:
        return Colors.blue;
    }
  }

  Color get backgroundColor => color.withOpacity(0.1);
  Color get borderColor => color.withOpacity(0.4);
}

@freezed
class Link with _$Link {
  const factory Link.facebook(String pageName) = _FacebookLink;
  const factory Link.gitHub(String owner, String repo) = _GitHubLink;
  const factory Link.googlePlay(String applicationId) = _GooglePlayLink;
  const factory Link.homepage(Uri url) = _HomepageLink;
  const factory Link.instagram(String username) = _InstagramLink;
  const factory Link.pubDev(String packageName) = _PubDevLink;
  const factory Link.twitter(String username) = _TwitterLink;
  const factory Link.youTube(String handle) = _YouTubeLink;
  const factory Link.other(
    Uri url,
    String tooltip, {
    required Widget icon,
  }) = _OtherLink;
  const Link._();

  Widget get icon {
    return map(
      facebook: (_) => BrandIcon.facebook.widget,
      gitHub: (_) => const Icon(FontAwesomeIcons.github),
      googlePlay: (_) => BrandIcon.googlePlay.widget,
      homepage: (_) => const Icon(Icons.web_outlined),
      instagram: (_) => BrandIcon.instagram.widget,
      pubDev: (_) => BrandIcon.dart.widget,
      twitter: (_) => BrandIcon.twitter.widget,
      youTube: (_) => BrandIcon.youTube.widget,
      other: (it) => it.icon,
    );
  }

  Uri get url {
    return map(
      facebook: (it) => Uri.https('facebook.com', '/${it.pageName}'),
      gitHub: (it) => Uri.https('github.com', '/${it.owner}/${it.repo}'),
      googlePlay: (it) => Uri.https(
        'play.google.com',
        '/store/apps/details?id=${it.applicationId}',
      ),
      homepage: (it) => it.url,
      instagram: (it) => Uri.https('instagram.com', '/${it.username}'),
      pubDev: (it) => Uri.https('pub.dev', '/packages/${it.packageName}'),
      twitter: (it) => Uri.https('twitter.com', '/${it.username}'),
      youTube: (it) => Uri.https('youtube.com', '/@${it.handle}'),
      other: (it) => it.url,
    );
  }

  String get tooltip {
    return map(
      facebook: (_) => 'View on Facebook',
      gitHub: (_) => 'View on GitHub',
      googlePlay: (_) => 'View on Google Play',
      homepage: (_) => 'Open homepage',
      instagram: (_) => 'View on Instagram',
      pubDev: (_) => 'View on pub.dev',
      twitter: (_) => 'View on Twitter',
      youTube: (_) => 'View on YouTube',
      other: (it) => it.tooltip,
    );
  }
}
