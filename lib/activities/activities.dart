import 'project.dart';
import 'tag.dart';

final activities = [
  Activity(
    'Expert at WorldSkills Germany',
    description:
        'Since 2020, I lead the skill/discipline “Mobile Applications Development” in Germany.',
    tags: {Tag.android, Tag.dart, Tag.flutter, Tag.worldSkills},
    links: {
      Link.other(Uri.parse('https://blz-it.de/en/skill08'), 'Our homepage'),
    },
  ),
  Activity(
    'National Judge & Trainer at WorldSkills Germany',
    description:
        'Since 2018, I am part of the German jury and trainer team for the skill/discipline “IT Software Solutions for Business”.',
    tags: {Tag.android, Tag.cSharp, Tag.worldSkills},
    links: {
      Link.other(Uri.parse('https://blz-it.de/en/skill09'), 'Our homepage'),
    },
  ),
  Activity(
    '🍭 Candy',
    description:
        'A sweet programming language that is robust, minimalistic, and expressive.',
    tags: {Tag.rust},
    links: {const Link.gitHub('candy-lang', 'candy')},
  ),
  Activity(
    'Timetable',
    description:
        '📅 Customizable flutter calendar widget including day and week views',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'timetable'),
      const Link.pubDev('timetable'),
    },
  ),
  Activity(
    'black_hole_flutter',
    description:
        '🛠 A package absorbing all Flutter utility functions, including extension functions and commonly used widgets',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'black_hole_flutter'),
      const Link.pubDev('black_hole_flutter'),
    },
  ),
  Activity(
    'swipeable_page_route',
    description:
        '🔙 Swipe to navigate back and admire beautifully morphing widgets',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'swipeable_page_route'),
      const Link.pubDev('swipeable_page_route'),
    },
  ),
  Activity(
    'rrule',
    description:
        '🔁 Recurrence rule parsing & calculation as defined in the iCalendar RFC',
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'rrule'),
      const Link.pubDev('rrule'),
    },
  ),
  Activity(
    'debug_overlay',
    description:
        '🐛 View debug infos and change settings via a central overlay for your app',
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'debug_overlay'),
      const Link.pubDev('debug_overlay'),
    },
  ),
  Activity(
    'Homepage',
    description: "You're looking at it!",
    tags: {Tag.dart, Tag.flutter},
    links: {const Link.gitHub('JonasWanke', 'homepage')},
  ),
  Activity(
    '🧭 flutter_deep_linking',
    description:
        'Handle all your routing with proper deep links and handle them declaratively!',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'flutter_deep_linking'),
      const Link.pubDev('flutter_deep_linking'),
    },
  ),
  Activity(
    '🔟 data_size',
    description:
        'Customizable data size (bit & byte) formatting for interfacing with the user',
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'data_size'),
      const Link.pubDev('data_size'),
    },
  ),
  Activity(
    "Cap'n Proto for Dart",
    description:
        "Pure Dart implementation of Cap'n Proto – an extremely efficient protocol for sharing data and capabilities",
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'capnproto-dart'),
      const Link.pubDev('capnproto'),
    },
  ),
  Activity(
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
  Activity(
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
  Activity(
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
  Activity(
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
  Activity(
    '🌍 L42n – for even better L10n!',
    isArchived: true,
    description: 'A desktop editor for .arb-files',
    tags: {Tag.dart, Tag.flutter},
    links: {const Link.gitHub('JonasWanke', 'l42n')},
  ),
  Activity(
    '🦄 Unicorn',
    isArchived: true,
    description: 'A tool to create, work on, test, and deploy projects',
    tags: {Tag.kotlin},
    links: {const Link.gitHub('JonasWanke', 'l42n')},
  ),
];
