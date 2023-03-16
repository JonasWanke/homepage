import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app/_.dart';

part 'data.freezed.dart';

@freezed
class Project with _$Project {
  const factory Project._(
    String title, {
    @Default(false) bool isArchived,
    required String description,
    required Set<Tag> tags,
    required Set<Link> links,
  }) = _Project;

  static final values = [
    Project._(
      'Expert at WorldSkills Germany',
      description:
          'Since 2020, I lead the skill/discipline “Mobile Applications Development” in Germany.',
      tags: {Tag.android, Tag.dart, Tag.flutter, Tag.worldSkills},
      links: {
        Link.other(Uri.parse('https://blz-it.de/en/skill08'), 'Our homepage'),
      },
    ),
    Project._(
      'National Judge & Trainer at WorldSkills Germany',
      description:
          'Since 2018, I am part of the German jury and trainer team for the skill/discipline “IT Software Solutions for Business”.',
      tags: {Tag.android, Tag.cSharp, Tag.worldSkills},
      links: {
        Link.other(Uri.parse('https://blz-it.de/en/skill09'), 'Our homepage'),
      },
    ),
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
      tags: {Tag.dart, Tag.flutter},
      links: {
        const Link.gitHub('JonasWanke', 'timetable'),
        const Link.pubDev('timetable'),
      },
    ),
    Project._(
      'black_hole_flutter',
      description:
          '🛠 A package absorbing all Flutter utility functions, including extension functions and commonly used widgets',
      tags: {Tag.dart, Tag.flutter},
      links: {
        const Link.gitHub('JonasWanke', 'black_hole_flutter'),
        const Link.pubDev('black_hole_flutter'),
      },
    ),
    Project._(
      'swipeable_page_route',
      description:
          '🔙 Swipe to navigate back and admire beautifully morphing widgets',
      tags: {Tag.dart, Tag.flutter},
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
      tags: {Tag.dart, Tag.flutter},
      links: {const Link.gitHub('JonasWanke', 'homepage')},
    ),
    Project._(
      '🧭 flutter_deep_linking',
      description:
          'Handle all your routing with proper deep links and handle them declaratively!',
      tags: {Tag.dart, Tag.flutter},
      links: {
        const Link.gitHub('JonasWanke', 'flutter_deep_linking'),
        const Link.pubDev('flutter_deep_linking'),
      },
    ),
    Project._(
      '🔟 data_size',
      description:
          'Customizable data size (bit & byte) formatting for interfacing with the user',
      tags: {Tag.dart},
      links: {
        const Link.gitHub('JonasWanke', 'data_size'),
        const Link.pubDev('data_size'),
      },
    ),
    Project._(
      "capnproto-dart: Cap'n Proto for Dart",
      description:
          "Pure Dart implementation of Cap'n Proto – an extremely efficient protocol for sharing data and capabilities",
      tags: {Tag.dart},
      links: {
        const Link.gitHub('JonasWanke', 'capnproto-dart'),
        const Link.pubDev('capnproto'),
      },
    ),
    Project._(
      '🥉 Bronze Medal at the WorldSkills Abu Dhabi 2017',
      description:
          'I competed in the skill/discipline “IT Software Solutions for Business” and won a bronze medal.',
      tags: {Tag.android, Tag.cSharp, Tag.kotlin, Tag.worldSkills},
      links: {
        const Link.gitHub('hpi-schul-cloud', 'schulcloud-flutter'),
        Link.other(
          Uri.parse('https://dbildungscloud.de'),
          'Homepage of the dBildungscloud',
        ),
        Link.other(
          Uri.parse('https://blog.dbildungscloud.de/author/jonas-wanke/'),
          'Blog article by me',
        ),
      },
    ),
    Project._(
      'dBildungscloud (formerly HPI Schul-Cloud)',
      isArchived: true,
      description:
          'The dBildungscloud is a cloud solution for German schools. I worked on the native Android app and later the Flutter app.',
      tags: {Tag.android, Tag.dart, Tag.flutter, Tag.kotlin},
      links: {
        const Link.gitHub('hpi-schul-cloud', 'schulcloud-flutter'),
        Link.other(
          Uri.parse('https://dbildungscloud.de'),
          'Homepage of the dBildungscloud',
        ),
        Link.other(
          Uri.parse('https://blog.dbildungscloud.de/author/jonas-wanke/'),
          'Blog article by me',
        ),
      },
    ),
    Project._(
      'Light your Dog',
      isArchived: true,
      description:
          'Light your Dog developed illuminated dog harnesses as an alternative to lighted collars. The harness is fitted to the anatomy of the dog and is optionally customizable using an android app via bluetooth, e.g., for changing colors.',
      tags: {Tag.android, Tag.jugendForscht, Tag.kotlin},
      links: {
        Link.other(
          Uri.parse(
            'https://www.berliner-woche.de/koepenick/c-bildung/jugend-forscht-hundegeschirr-bringt-bello-zum-leuchten_a119538',
          ),
          'Article in the newspaper “Berliner Woche”',
        ),
      },
    ),
    Project._(
      'DOSUAS',
      isArchived: true,
      description:
          "DOSUAS is a device which uses acoustic signals for guiding blind people. We first take a 3D-picture of a camera mounted on the person's head, then convert it using different algorithms and finally output it on stereo-headphones. The distance is hereby represented by the pitch of the output – higher pitches correspond to something close, lower pitches to something more distant.",
      tags: {Tag.jugendForscht},
      links: {
        Link.other(
          Uri.parse(
            'https://www.berliner-woche.de/friedrichshain/c-bildung/mit-den-ohren-sehen-sonderpreis-fuer-friedrichshainer-schueler-bei-jugend-forscht_a163463',
          ),
          'Article in the newspaper “Berliner Woche”',
        ),
      },
    ),
    Project._(
      '🌍 L42n – for even better L10n!',
      isArchived: true,
      description: 'A desktop editor for .arb-files',
      tags: {Tag.dart, Tag.flutter},
      links: {const Link.gitHub('JonasWanke', 'l42n')},
    ),
    Project._(
      '🦄 Unicorn',
      isArchived: true,
      description: 'A tool to create, work on, test, and deploy projects',
      tags: {Tag.kotlin},
      links: {const Link.gitHub('JonasWanke', 'l42n')},
    ),
  ];
}

enum Tag {
  worldSkills(
    'WorldSkills',
    'The WorldSkills Competition is held every two years and is the biggest vocational education and skills excellence event in the world.',
    icon: _worldSkillsIcon,
  ),
  jugendForscht(
    'Jugend forscht',
    'A German youth science competition',
    icon: _jugendForschtIcon,
  ),
  flutter(
    'Flutter',
    '“Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.”',
    icon: _flutterIcon,
  ),
  dart(
    'Dart',
    'Dart is a client-optimized language for fast apps on any platform',
    icon: _dartIcon,
  ),
  rust(
    'Rust',
    'Rust is a language empowering everyone to build reliable and efficient software',
    icon: _rustIcon,
  ),
  android(
    'Android App',
    'An app written for Android',
    icon: _androidIcon,
  ),
  kotlin(
    'Kotlin',
    'Kotlin is a cross-platform, general-purpose high-level programming language',
    icon: _kotlinIcon,
  ),
  cSharp(
    'C#',
    'C# is a modern, object-oriented, and type-safe programming language',
    icon: _cSharpIcon,
  );

  const Tag(this.title, this.tooltip, {this.icon});

  final String title;
  final String tooltip;
  final Widget? icon;
}

enum ProjectStatus { active, archived }

@freezed
class Link with _$Link {
  const factory Link.gitHub(String owner, String repo) = _GitHubLink;
  const factory Link.pubDev(String packageName) = _PubDevLink;
  const factory Link.other(Uri url, String tooltip) = _OtherLink;
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
      other: (it) => it.tooltip,
    );
  }
}

const _androidIcon = ProportionalPadding(
  padding: EdgeInsets.only(bottom: 0.1),
  child: Image(image: AssetImage('assets/icons/android.webp')),
);
const _cSharpIcon = Image(image: AssetImage('assets/icons/cSharp.webp'));
const _dartIcon = ProportionalPadding(
  padding: EdgeInsets.all(0.1),
  child: Image(image: AssetImage('assets/icons/dart.webp')),
);
const _flutterIcon = ProportionalPadding(
  padding: EdgeInsets.only(top: 0.1, right: 0.1, bottom: 0.1),
  child: Image(image: AssetImage('assets/icons/flutter.webp')),
);
const _jugendForschtIcon =
    Image(image: AssetImage('assets/icons/jugendForscht.webp'));
const _rustIcon = Image(image: AssetImage('assets/icons/rust.webp'));
const _kotlinIcon = ProportionalPadding(
  padding: EdgeInsets.only(left: 0.25, top: 0.1, bottom: 0.1),
  child: Image(image: AssetImage('assets/icons/kotlin.webp')),
);
const _worldSkillsIcon =
    Image(image: AssetImage('assets/icons/worldSkills.webp'));
