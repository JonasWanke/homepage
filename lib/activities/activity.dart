import 'package:dartx/dartx.dart';
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
    PrimaryTag? primaryTag,
    @Default(<Tag>{}) Set<Tag> tags,
    @Default(<Link>{}) Set<Link> links,
  }) = _Activity;
  const Activity._();

  bool get isOngoing => end == null;
}

extension ListOfActivity on List<Activity> {
  List<Activity> sortedByEndLength() {
    return sortedByDescending((it) => it.end ?? LocalMonth.current)
        .thenByDescending((it) => it.start);
  }
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
  const factory Link.article(Uri url, String tooltip) = _ArticleLink;
  const factory Link.competitionResults(Uri url, String tooltip) =
      _CompetitionResultsLink;
  const factory Link.facebook(String pageName) = _FacebookLink;
  const factory Link.gitHub(String owner, String repo) = _GitHubLink;
  const factory Link.googlePlay(String applicationId) = _GooglePlayLink;
  const factory Link.homepage(Uri url) = _HomepageLink;
  const factory Link.instagram(String username) = _InstagramLink;
  const factory Link.newspaperArticle(String newspaperName, Uri url) =
      _NewspaperArticleLink;
  const factory Link.pubDev(String packageName) = _PubDevLink;
  const factory Link.twitter(String username) = _TwitterLink;
  const factory Link.youTubeChannel(String handle) = _YouTubeChannelLink;
  const factory Link.youTubeVideo(String id, String tooltip) =
      _YouTubeVideoLink;
  const factory Link.other(
    Uri url,
    String tooltip, {
    required Widget icon,
  }) = _OtherLink;
  const Link._();

  Widget get icon {
    return map(
      article: (_) => const Icon(Icons.article_outlined),
      competitionResults: (_) => const Icon(FontAwesomeIcons.award),
      facebook: (_) => BrandIcon.facebook.widget,
      gitHub: (_) => const Icon(FontAwesomeIcons.github),
      googlePlay: (_) => BrandIcon.googlePlay.widget,
      homepage: (_) => const Icon(Icons.web_outlined),
      instagram: (_) => BrandIcon.instagram.widget,
      newspaperArticle: (_) => const Icon(Icons.article_outlined),
      pubDev: (_) => BrandIcon.dart.widget,
      twitter: (_) => BrandIcon.twitter.widget,
      youTubeChannel: (_) => BrandIcon.youTube.widget,
      youTubeVideo: (_) => BrandIcon.youTube.widget,
      other: (it) => it.icon,
    );
  }

  Uri get url {
    return map(
      article: (it) => it.url,
      competitionResults: (it) => it.url,
      facebook: (it) => Uri.https('facebook.com', '/${it.pageName}'),
      gitHub: (it) => Uri.https('github.com', '/${it.owner}/${it.repo}'),
      googlePlay: (it) => Uri.https(
        'play.google.com',
        '/store/apps/details?id=${it.applicationId}',
      ),
      homepage: (it) => it.url,
      instagram: (it) => Uri.https('instagram.com', '/${it.username}'),
      newspaperArticle: (it) => it.url,
      pubDev: (it) => Uri.https('pub.dev', '/packages/${it.packageName}'),
      twitter: (it) => Uri.https('twitter.com', '/${it.username}'),
      youTubeChannel: (it) => Uri.https('youtube.com', '/@${it.handle}'),
      youTubeVideo: (it) => Uri.https('youtube.com', '/watch', {'v': it.id}),
      other: (it) => it.url,
    );
  }

  String get tooltip {
    return map(
      article: (it) => it.tooltip,
      competitionResults: (it) => it.tooltip,
      facebook: (_) => 'View on Facebook',
      gitHub: (_) => 'View on GitHub',
      googlePlay: (_) => 'View on Google Play',
      homepage: (_) => 'Open homepage',
      instagram: (_) => 'View on Instagram',
      newspaperArticle: (it) =>
          'Read an article in the newspaper “${it.newspaperName}”',
      pubDev: (_) => 'View on pub.dev',
      twitter: (_) => 'View on Twitter',
      youTubeChannel: (_) => 'View channel on YouTube',
      youTubeVideo: (it) => it.tooltip,
      other: (it) => it.tooltip,
    );
  }
}
