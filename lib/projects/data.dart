import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app/_.dart';

part 'data.freezed.dart';

@freezed
class Project with _$Project {
  const factory Project._(
    String title, {
    required String description,
    required Set<Tag> tags,
    required Set<Link> links,
  }) = _Project;

  static final values = [
    Project._(
      '🍭 Candy',
      description:
          'A sweet programming language that is robust, minimalistic, and expressive.',
      tags: {Tag.rust},
      links: {const Link.gitHub('candy-lang', 'candy')},
    ),
    Project._(
      'Timetable',
      description:
          '📅 Customizable flutter calendar widget including day and week views',
      tags: {Tag.flutter, Tag.dart},
      links: {
        const Link.gitHub('JonasWanke', 'timetable'),
        const Link.pubDev('timetable'),
      },
    ),
    Project._(
      'black_hole_flutter',
      description:
          '🛠 A package absorbing all Flutter utility functions, including extension functions and commonly used widgets',
      tags: {Tag.flutter, Tag.dart},
      links: {
        const Link.gitHub('JonasWanke', 'black_hole_flutter'),
        const Link.pubDev('black_hole_flutter'),
      },
    ),
    Project._(
      'swipeable_page_route',
      description:
          '🔙 Swipe to navigate back and admire beautifully morphing widgets',
      tags: {Tag.flutter, Tag.dart},
      links: {
        const Link.gitHub('JonasWanke', 'swipeable_page_route'),
        const Link.pubDev('swipeable_page_route'),
      },
    ),
    Project._(
      'rrule',
      description:
          '🔁 Recurrence rule parsing & calculation as defined in the iCalendar RFC',
      tags: {Tag.dart},
      links: {
        const Link.gitHub('JonasWanke', 'rrule'),
        const Link.pubDev('rrule'),
      },
    ),
    Project._(
      'debug_overlay',
      description:
          '🐛 View debug infos and change settings via a central overlay for your app',
      tags: {Tag.dart},
      links: {
        const Link.gitHub('JonasWanke', 'debug_overlay'),
        const Link.pubDev('debug_overlay'),
      },
    ),
    Project._(
      'Homepage',
      description: "You're looking at it!",
      tags: {Tag.flutter, Tag.dart},
      links: {const Link.gitHub('JonasWanke', 'homepage')},
    ),
  ];
}

enum Tag {
  flutter('Flutter', icon: _flutterIcon),
  dart('Dart', icon: _dartIcon),
  rust('Rust', icon: _rustIcon);

  const Tag(this.title, {this.icon});

  final String title;
  final Widget? icon;
}

enum ProjectStatus { active, archived }

@freezed
class Link with _$Link {
  const factory Link.gitHub(String owner, String repo) = _GitHubLink;
  const factory Link.pubDev(String packageName) = _PubDevLink;
  const factory Link.other(Uri url) = _OtherLink;
  const Link._();

  Widget get icon {
    return map(
      gitHub: (_) => const Icon(FontAwesomeIcons.github),
      pubDev: (_) => _dartIcon,
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
      other: (_) => 'Open website',
    );
  }
}

const _dartIcon = ProportionalPadding(
  padding: EdgeInsets.all(0.1),
  child: Image(image: AssetImage('assets/icons/dart.webp')),
);
const _flutterIcon = ProportionalPadding(
  padding: EdgeInsets.only(top: 0.1, right: 0.1, bottom: 0.1),
  child: Image(image: AssetImage('assets/icons/flutter.webp')),
);
const _rustIcon = Image(image: AssetImage('assets/icons/rust.webp'));
