import 'package:supernova_flutter/supernova_flutter.dart';

import 'link.dart';
import 'tag.dart';

class Activity {
  const Activity(
    this.title,
    this.type, {
    this.emoji,
    this.isHighlight = false,
    required this.start,
    this.end,
    required this.description,
    this.primaryTag,
    this.tags = const <Tag>{},
    this.links = const <Link>{},
  });

  final String title;
  final String? emoji;
  String get fullTitle => emoji == null ? title : '$emoji $title';
  final ActivityType type;
  final bool isHighlight;
  final LocalMonth start;
  final LocalMonth? end;
  final String? description;
  final PrimaryTag? primaryTag;
  final Set<Tag> tags;
  final Set<Link> links;
  bool get isOngoing => end == null;

  static final values = [
    bachelor,
    generalQualification,
    aGym,
    cashew,
    smusy,
    skillChecker,
    dBildungscloud,
    dBildungscloudInternship,
    worldSkillsSkill08,
    eventsClub,
    culinaryClub,
    mobileDevClub,
    worldSkillsSkill09,
    worldSkillsAbuDhabi,
    dosuas,
    worldSkillsAlbertEinsteinCup,
    worldSkillsGermanChampionships,
    mathematicalGrammarSchoolCup,
    debugOverlay,
    capnProto,
    candy,
    dataSize,
    rrule,
    swipeablePageRoute,
    flutterDeepLinking,
    l42n,
    blackHoleFlutter,
    timetable,
    unicorn,
    homepage,
    lightYourDog,
  ];

  // Education
  static final bachelor = Activity(
    'Bachelor of Science',
    ActivityType.education,
    isHighlight: true,
    start: const LocalMonth(2018, 10),
    end: const LocalMonth(2021, 09),
    description:
        'I learned practical software engineering and more collaborative development, as well as deepened my understanding of fundamentals in the IT-Systems Engineering course of studies at the Hasso Plattner Institute.',
    primaryTag: PrimaryTag.hassoPlattnerInstitute,
    links: {Link.homepage(Uri.parse('https://hpi.de'))},
  );
  static final generalQualification = Activity(
    'General Qualification for University Entrance (“Abitur”)',
    ActivityType.education,
    isHighlight: true,
    start: const LocalMonth(2010, 10),
    end: const LocalMonth(2018, 06),
    description:
        'I also earned an additional degree for the first math semester from the Humboldt University by participating in intensified math and IT courses.',
    primaryTag: PrimaryTag.heinrichHertzGymnasium,
    links: {Link.homepage(Uri.parse('https://hhgym.de'))},
  );

  // Work
  static const aGym = Activity(
    'Flutter, Firebase, & TypeScript Developer at A GYM',
    ActivityType.work,
    isHighlight: true,
    start: LocalMonth(2023, 06),
    description: 'Coming soon',
    primaryTag: PrimaryTag.aGym,
    tags: {
      Tag.android,
      Tag.dart,
      Tag.flutter,
      Tag.firebase,
      Tag.gitHub,
      Tag.gitHubActions,
      Tag.googleCloudPlatform,
    },
  );
  static const cashew = Activity(
    'CO₂ Measurement',
    ActivityType.work,
    isHighlight: true,
    start: LocalMonth(2021, 07),
    end: LocalMonth(2021, 07),
    description:
        'We developed a CO₂ measurement device including a database and a web frontend.',
  );
  static final smusy = Activity(
    'Flutter, Dart, & Google Cloud Developer at smusy.',
    ActivityType.work,
    isHighlight: true,
    start: const LocalMonth(2020, 09),
    end: const LocalMonth(2023, 04),
    description:
        'I co-architected and co-designed the smusy.app, dashboards, backend, and API.',
    primaryTag: PrimaryTag.smusy,
    tags: {
      Tag.android,
      Tag.dart,
      Tag.flutter,
      Tag.firebase,
      Tag.gitHub,
      Tag.gitHubActions,
      Tag.googleCloudPlatform,
      Tag.terraform,
    },
    links: {Link.homepage(Uri.parse('https://smusy.app'))},
  );
  static final skillChecker = Activity(
    'Android Developer for Skill Checker',
    ActivityType.work,
    isHighlight: true,
    start: const LocalMonth(2018, 11),
    end: const LocalMonth(2019, 02),
    description:
        'I worked for Samsung and WorldSkills Germany on the SkillChecker Android app that helps young people find a professional orientation.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.kotlin},
    links: {Link.googlePlay('com.worldskills.skillchecker')},
  );
  static final dBildungscloud = Activity(
    'Flutter and Android developer at dBildungscloud',
    ActivityType.work,
    isHighlight: true,
    start: const LocalMonth(2017, 12),
    end: const LocalMonth(2021, 03),
    description:
        'I worked on the native Android app and later the Flutter app.',
    primaryTag: PrimaryTag.dBildungscloud,
    tags: {
      Tag.android,
      Tag.dart,
      Tag.flutter,
      Tag.gitHub,
      Tag.gitHubActions,
      Tag.jira,
      Tag.kotlin,
    },
    links: {
      Link.gitHubRepository('hpi-schul-cloud', 'schulcloud-flutter'),
      _dBildungscloudHomepageLink,
      Link.article(
        Uri.parse('https://blog.dbildungscloud.de/author/jonas-wanke/'),
        'Blog article by me',
      ),
    },
  );
  static final dBildungscloudInternship = Activity(
    'Internship: Android Developer at dBildungscloud',
    ActivityType.work,
    start: const LocalMonth(2017, 07),
    end: const LocalMonth(2017, 08),
    description:
        "During summer vacations at school, I worked on the HPI Schul-Cloud's (now called dBildungscloud) Android app.",
    primaryTag: PrimaryTag.dBildungscloud,
    tags: {Tag.android, Tag.firebase, Tag.gitHub, Tag.java},
    links: {_dBildungscloudHomepageLink},
  );

  // Volunteering
  static final worldSkillsSkill08 = Activity(
    'WorldSkills Germany Expert',
    ActivityType.volunteering,
    isHighlight: true,
    start: const LocalMonth(2020, 06),
    description:
        'I co-organized national competitions and prepared competitors for WorldSkills as the expert and national coach for the skill/discipline “Mobile Applications Development” at WorldSkills Germany.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.dart, Tag.flutter, Tag.gitHub, Tag.kotlin},
    links: {
      Link.homepage(Uri.parse('https://blz-it.de/en/skill08')),
      ..._germanItSkillsSocialLinks,
    },
  );
  static const eventsClub = Activity(
    'Co-Head of the Events Club',
    ActivityType.volunteering,
    start: LocalMonth(2019, 06),
    end: LocalMonth(2021, 09),
    description:
        'The events club is responsible for food and beverages at many HPI events like the christmas party, halloween party, and spring festival.',
    primaryTag: PrimaryTag.hassoPlattnerInstitute,
  );
  static final culinaryClub = Activity(
    'Co-Head of the Culinary Club',
    ActivityType.volunteering,
    start: const LocalMonth(2019, 04),
    end: const LocalMonth(2020, 11),
    description:
        'Members of the Culinary Club regularly meet to cook or bake together. I was responsible for the baking part and organized a motive cake workshop. I also lead the creation of the HPI summer party cake in 2019 feeding around 400 people.',
    primaryTag: PrimaryTag.hassoPlattnerInstitute,
    links: {
      Link.newspaperArticle(
        'Märkische Allgemeine Zeitung',
        Uri.parse(
          'https://www.maz-online.de/lokales/potsdam/hpi-feiert-14-sommerfest-in-potsdam-SSDZ5UPGFDFJ45JT2IA3J4YVKM.html',
        ),
      ),
    },
  );
  static final mobileDevClub = Activity(
    'Head/Co-Head of the MobileDev Club',
    ActivityType.volunteering,
    start: const LocalMonth(2018, 11),
    end: const LocalMonth(2021, 09),
    description:
        'I rebuilt the club from the ground up and organized weekly meetings. As part of the club, I organized a Google I/O Extended Event (2019) and Flutter, Material Design, Kotlin, and Git workshops. I also architected & co-designed the native HPI Android app and later on the Flutter app, as well as the backend.',
    primaryTag: PrimaryTag.hassoPlattnerInstitute,
    tags: {
      Tag.android,
      Tag.dart,
      Tag.flutter,
      Tag.gitHub,
      Tag.gitHubActions,
      Tag.grpc,
      Tag.kotlin,
      Tag.protocolBuffers,
    },
    links: {Link.gitHubUser('hpi-de')},
  );
  static final worldSkillsSkill09 = Activity(
    'WorldSkills Germany Jury Member & National Trainer',
    ActivityType.volunteering,
    isHighlight: true,
    start: const LocalMonth(2018, 02),
    description:
        'Since 2018, I am part of the German jury and trainer team for the skill/discipline “IT Software Solutions for Business”.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.cSharp, Tag.gitHub},
    links: {
      Link.homepage(Uri.parse('https://blz-it.de/en/skill09')),
      ..._germanItSkillsSocialLinks,
    },
  );

  // Competition
  static final worldSkillsAbuDhabi = Activity(
    'Bronze Medal at the WorldSkills Abu Dhabi 2017',
    emoji: '🥉',
    ActivityType.competition,
    isHighlight: true,
    start: const LocalMonth(2017, 10),
    end: const LocalMonth(2017, 10),
    description:
        'I won a bronze medal (the first ever German medal in ICT skills) in the skill/discipline “IT Software Solutions for Business” at the WorldSkills Abu Dhabi 2017 among 27 countries/regions as the youngest competitor.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.cSharp, Tag.kotlin},
    links: {
      Link.competitionResults(
        Uri.parse(
          'https://worldskillsabudhabi2017.com/en/skills/it-software-solutions-business/index.html',
        ),
        'Official results of this skill',
      ),
      Link.other(
        const Icon(Icons.web_outlined),
        Uri.parse(
          'https://www.worldskillsgermany.com/hall-of-fame/worldskills/worldskills-abu-dhabi-2017/',
        ),
        "WorldSkills Germany's page about this event",
      ),
      Link.article(
        Uri.parse(
          'https://www.worldskillsgermany.com/blog/2017/10/20/deutsches-nationalteam-mit-guter-wm-bilanz/',
        ),
        "WorldSkills Germany's article about this event's results",
      ),
      Link.newspaperArticle(
        'Berliner Woche',
        Uri.parse(
          'https://www.berliner-woche.de/adlershof/c-leute/gymnasiast-jonas-wanke-aus-adlershof-holte-bei-der-weltmeisterschaft-worldskills-bronze_a135986',
        ),
      ),
    },
  );
  static final dosuas = Activity(
    'DOSUAS',
    ActivityType.competition,
    isHighlight: true,
    start: const LocalMonth(2017, 12),
    end: const LocalMonth(2018, 05),
    description:
        "DOSUAS is a device which uses acoustic signals for guiding blind people. We first take a 3D picture of a camera mounted on the person's head, then convert it using different algorithms and finally output it on stereo headphones. The distance is hereby represented by the pitch of the output – higher pitches correspond to something close, lower pitches to something more distant. We won the Konrad Zuse youth prize by the Eduard Rhein Foundation at the national round of Jugend forscht.",
    primaryTag: PrimaryTag.jugendForscht,
    tags: {Tag.gitHub},
    links: {
      Link.competitionResults(
        Uri.parse(
          'https://www.eduard-rhein-stiftung.de/konrad-zuse-jugendpreises-2018-fuer-informatik-der-eduard-rhein-stiftung-dosuas-die-symphonie-des-sehens-akustischer-wegweiser/',
        ),
        "Entry about the youth prize on the Eduard Rhein Foundation's website",
      ),
      Link.newspaperArticle(
        'Berliner Woche',
        Uri.parse(
          'https://www.berliner-woche.de/friedrichshain/c-bildung/mit-den-ohren-sehen-sonderpreis-fuer-friedrichshainer-schueler-bei-jugend-forscht_a163463',
        ),
      ),
    },
  );
  static final worldSkillsAlbertEinsteinCup = Activity(
    'Bronze Medal at the Albert Einstein Cup',
    emoji: '🥉',
    ActivityType.competition,
    start: const LocalMonth(2017, 06),
    end: const LocalMonth(2017, 06),
    description:
        'I won the bronze medal (3rd place) at the European championship of WorldSkills in skill/discipline “IT Software Solutions for Business” among seven competitors.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.cSharp, Tag.kotlin},
    links: {
      Link.youTubeVideo('BsBxcwiwOeg', 'Video about this event'),
      Link.article(
        Uri.parse('https://hhgym.de/worldskills-einstein-cup/'),
        "My school's article about this event",
      ),
      Link.article(
        Uri.parse(
          'https://www.worldskillsgermany.com/blog/2017/06/01/junge-europaeische-it-exzellenz-beim-albert-einstein-cup/',
        ),
        "WorldSkills Germany's article about this event",
      ),
    },
  );
  static final worldSkillsGermanChampionships = Activity(
    'Silver Medal at the German championships',
    emoji: '🥈',
    ActivityType.competition,
    start: const LocalMonth(2017, 02),
    end: const LocalMonth(2017, 02),
    description:
        'I won the silver medal (2nd place) at the German championship of WorldSkills in skill/discipline “IT Software Solutions for Business” among eight competitors.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.cSharp, Tag.kotlin},
    links: {
      Link.article(
        Uri.parse('https://hhgym.de/deutsche-meisterschaften-der-it-berufe/'),
        "My school's article about this event",
      ),
      Link.article(
        Uri.parse(
          'https://www.worldskillsgermany.com/blog/2017/02/20/meisterhaft-junge-berufe%e2%80%90champions-ueberzeugen-mit-top%e2%80%90leistungen-auf-der-didacta/',
        ),
        "WorldSkills Germany's article about this event",
      ),
    },
  );
  static final mathematicalGrammarSchoolCup = Activity(
    'Mathematical Grammar School Cup',
    ActivityType.competition,
    start: const LocalMonth(2016, 06),
    end: const LocalMonth(2016, 06),
    description: 'I won a silver medal in the computer science category.',
    primaryTag: PrimaryTag.mathematicalGrammarSchoolCup,
    tags: {Tag.cSharp},
    links: {
      Link.homepage(Uri.parse('https://www.cup.mg.edu.rs/')),
      Link.competitionResults(
        Uri.parse('https://www.cup.mg.edu.rs/mgsc/mgsc-2016'),
        'Problems, solutions, and results of this competition',
      ),
    },
  );

  // Project
  static final debugOverlay = Activity(
    'debug_overlay',
    emoji: '🐛',
    ActivityType.project,
    start: const LocalMonth(2021, 03),
    description:
        'View debug infos and change settings via a central overlay for your app',
    tags: {Tag.dart, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'debug_overlay'),
      Link.pubDev('debug_overlay'),
    },
  );
  static final capnProto = Activity(
    "Cap'n Proto for Dart",
    ActivityType.project,
    start: const LocalMonth(2020, 12),
    end: const LocalMonth(2021, 05),
    description:
        "Pure Dart implementation of Cap'n Proto – an extremely efficient protocol for sharing data and capabilities",
    tags: {Tag.dart, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'capnproto-dart'),
      Link.pubDev('capnproto'),
    },
  );
  static final candy = Activity(
    'Candy',
    emoji: '🍭',
    ActivityType.project,
    isHighlight: true,
    start: const LocalMonth(2020, 06),
    description:
        "A sweet programming language that is robust, minimalistic, and expressive. We're creating this language from scratch.",
    tags: {Tag.dart, Tag.gitHub, Tag.gitHubActions, Tag.rust},
    links: {Link.gitHubRepository('candy-lang', 'candy')},
  );
  static final dataSize = Activity(
    'data_size',
    emoji: '🔟',
    ActivityType.project,
    start: const LocalMonth(2020, 05),
    end: const LocalMonth(2021, 03),
    description:
        'Customizable data size (bit & byte) formatting for interfacing with the user',
    tags: {Tag.dart, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'data_size'),
      Link.pubDev('data_size'),
    },
  );
  static final rrule = Activity(
    'rrule',
    emoji: '🔁',
    ActivityType.project,
    start: const LocalMonth(2020, 05),
    description:
        'Recurrence rule parsing & calculation as defined in the iCalendar RFC',
    tags: {Tag.dart, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'rrule'),
      Link.pubDev('rrule'),
    },
  );
  static final swipeablePageRoute = Activity(
    'swipeable_page_route',
    emoji: '🔙',
    ActivityType.project,
    start: const LocalMonth(2020, 04),
    description:
        'Swipe to navigate back and admire beautifully morphing widgets',
    tags: {Tag.dart, Tag.flutter, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'swipeable_page_route'),
      Link.pubDev('swipeable_page_route'),
    },
  );
  static final flutterDeepLinking = Activity(
    'flutter_deep_linking',
    emoji: '🧭',
    ActivityType.project,
    start: const LocalMonth(2020, 03),
    end: const LocalMonth(2021, 04),
    description:
        'Handle all your routing with proper deep links and handle them declaratively!',
    tags: {Tag.dart, Tag.flutter, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'flutter_deep_linking'),
      Link.pubDev('flutter_deep_linking'),
    },
  );
  static final l42n = Activity(
    'L42n – for even better L10n!',
    emoji: '🌍',
    ActivityType.project,
    start: const LocalMonth(2020, 03),
    end: const LocalMonth(2020, 03),
    description: 'A desktop editor for .arb-files',
    tags: {Tag.dart, Tag.flutter, Tag.gitHub},
    links: {Link.gitHubRepository('JonasWanke', 'l42n')},
  );
  static final blackHoleFlutter = Activity(
    'black_hole_flutter',
    emoji: '🛠',
    ActivityType.project,
    start: const LocalMonth(2020, 03),
    description:
        'A package absorbing all Flutter utility functions, including extension functions and commonly used widgets',
    tags: {Tag.dart, Tag.flutter, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'black_hole_flutter'),
      Link.pubDev('black_hole_flutter'),
    },
  );
  static final timetable = Activity(
    'Timetable',
    emoji: '📅',
    ActivityType.project,
    isHighlight: true,
    start: const LocalMonth(2020, 01),
    description:
        'Customizable flutter calendar widget including day and week views',
    tags: {Tag.dart, Tag.flutter, Tag.gitHub, Tag.gitHubActions},
    links: {
      Link.gitHubRepository('JonasWanke', 'timetable'),
      Link.pubDev('timetable'),
    },
  );
  static final unicorn = Activity(
    'Unicorn',
    emoji: '🦄',
    ActivityType.project,
    start: const LocalMonth(2019, 01),
    end: const LocalMonth(2020, 04),
    description: 'A tool to create, work on, test, and deploy projects',
    tags: {Tag.gitHub, Tag.gitHubActions, Tag.kotlin},
    links: {Link.gitHubRepository('JonasWanke', 'l42n')},
  );
  static final homepage = Activity(
    'Homepage',
    ActivityType.project,
    start: const LocalMonth(2017, 03),
    description: "You're looking at it!",
    tags: {Tag.dart, Tag.flutter, Tag.gitHub, Tag.gitHubActions},
    links: {Link.gitHubRepository('JonasWanke', 'homepage')},
  );
  static final lightYourDog = Activity(
    'Light your Dog',
    ActivityType.project,
    start: const LocalMonth(2016, 11),
    end: const LocalMonth(2018, 05),
    description:
        'Light your Dog developed illuminated dog harnesses as an alternative to lighted collars. The harness is fitted to the anatomy of the dog and is optionally customizable using an android app via bluetooth, e.g., for changing colors. With this project, we participated in the competition Jugend forscht.',
    primaryTag: PrimaryTag.jugendForscht,
    tags: {Tag.android, Tag.firebase, Tag.gitHub, Tag.java},
    links: {
      Link.instagram('lightyourdog'),
      Link.twitter('LightYourDog'),
      Link.newspaperArticle(
        'Berliner Woche',
        Uri.parse(
          'https://www.berliner-woche.de/koepenick/c-bildung/jugend-forscht-hundegeschirr-bringt-bello-zum-leuchten_a119538',
        ),
      ),
    },
  );

  static final _germanItSkillsSocialLinks = {
    Link.youTubeChannel('GermanItSkills'),
    Link.instagram('german.it.skills'),
    Link.facebook('GermanItSkills'),
    Link.twitter('GermanItSkills'),
  };
  static final _dBildungscloudHomepageLink =
      Link.homepage(Uri.parse('https://dbildungscloud.de'));
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
