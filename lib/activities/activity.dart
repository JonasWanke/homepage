import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app/_.dart';
import 'local_month.dart';
import 'tag.dart';

part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  const factory Activity(
    String title, {
    required LocalMonth start,
    LocalMonth? end,
    required String description,
    required Set<Tag> tags,
    required Set<Link> links,
  }) = _Activity;
  const Activity._();

  bool get isOngoing => end == null;
}

@freezed
class Link with _$Link {
  const factory Link.gitHub(String owner, String repo) = _GitHubLink;
  const factory Link.pubDev(String packageName) = _PubDevLink;
  const factory Link.other(Uri url, String tooltip) = _OtherLink;
  const Link._();

  Widget get icon {
    return map(
      gitHub: (_) => const Icon(FontAwesomeIcons.github),
      pubDev: (_) => Tag.dart.icon,
      other: (_) => const Icon(Icons.public),
    );
  }

  Uri get url {
    return map(
      gitHub: (it) => Uri.https('github.com', '/${it.owner}/${it.repo}'),
      pubDev: (it) => Uri.https('pub.dev', '/packages/${it.packageName}'),
      other: (it) => it.url,
    );
  }

  String get tooltip {
    return map(
      gitHub: (_) => 'Open on GitHub',
      pubDev: (_) => 'Open on pub.dev',
      other: (it) => it.tooltip,
    );
  }
}
