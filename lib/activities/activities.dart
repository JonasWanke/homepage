import '../app/_.dart';
import 'activity.dart';
import 'local_month.dart';
import 'tag.dart';

final activities = [
  // Education
  Activity(
    'Bachelor of Science',
    ActivityType.education,
    isHighlight: true,
    start: LocalMonth(2018, 10),
    end: LocalMonth(2021, 09),
    description:
        'I learned practical software engineering and more collaborative development, as well as deepened my understanding of fundamentals in the IT-Systems Engineering course of studies at the Hasso Plattner Institute.',
    primaryTag: PrimaryTag.hassoPlattnerInstitute,
    links: {Link.homepage(Uri.parse('https://hpi.de'))},
  ),

  // Work
  Activity(
    'Flutter, Dart, & Google Cloud Developer at smusy.',
    ActivityType.work,
    isHighlight: true,
    start: LocalMonth(2020, 09),
    description:
        'I co-architected and co-designed the smusy.app, dashboards, backend, and API.',
    primaryTag: PrimaryTag.smusy,
    tags: {
      Tag.android,
      Tag.dart,
      Tag.flutter,
      Tag.firebase,
      Tag.googleCloudPlatform,
      Tag.terraform,
    },
    links: {Link.homepage(Uri.parse('https://smusy.app'))},
  ),
  Activity(
    'Android Developer for Skill Checker',
    ActivityType.work,
    isHighlight: true,
    start: LocalMonth(2018, 11),
    end: LocalMonth(2019, 02),
    description:
        'I worked for Samsung and WorldSkills Germany on the SkillChecker Android app that helps young people find a professional orientation.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.kotlin},
    links: {const Link.googlePlay('com.worldskills.skillchecker')},
  ),
  Activity(
    'Flutter and Android developer at dBildungscloud',
    ActivityType.work,
    isHighlight: true,
    start: LocalMonth(2017, 12),
    end: LocalMonth(2021, 03),
    description:
        'The dBildungscloud is a cloud solution for German schools. I worked on the native Android app and later the Flutter app.',
    primaryTag: PrimaryTag.dBildungscloud,
    tags: {Tag.android, Tag.dart, Tag.flutter, Tag.kotlin},
    links: {
      const Link.gitHub('hpi-schul-cloud', 'schulcloud-flutter'),
      _dBildungscloudHomepageLink,
      Link.article(
        Uri.parse('https://blog.dbildungscloud.de/author/jonas-wanke/'),
        'Blog article by me',
      ),
    },
  ),
  Activity(
    'Internship: Android Developer at dBildungscloud',
    ActivityType.work,
    start: LocalMonth(2017, 07),
    end: LocalMonth(2017, 08),
    description:
        "During summer vacations at school, I worked on the HPI Schul-Cloud's (now called dBildungscloud) Android app.",
    primaryTag: PrimaryTag.dBildungscloud,
    tags: {Tag.android, Tag.firebase, Tag.java},
    links: {_dBildungscloudHomepageLink},
  ),

  // Volunteering
  Activity(
    'WorldSkills Germany Expert',
    ActivityType.volunteering,
    isHighlight: true,
    start: LocalMonth(2020, 06),
    description:
        'I co-organized national competitions and prepared competitors for WorldSkills as the expert and national coach for the skill/discipline “Mobile Applications Development” at WorldSkills Germany.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.dart, Tag.flutter, Tag.kotlin},
    links: {
      Link.homepage(Uri.parse('https://blz-it.de/en/skill08')),
      ..._germanItSkillsSocialLinks,
    },
  ),
  Activity(
    'Co-Head of the Events Club',
    ActivityType.volunteering,
    start: LocalMonth(2019, 06),
    end: LocalMonth(2021, 09),
    description:
        'The events club is responsible for food and beverages at many HPI events like the christmas party, halloween party, and spring festival.',
    primaryTag: PrimaryTag.hassoPlattnerInstitute,
  ),
  Activity(
    'Co-Head of the Culinary Club',
    ActivityType.volunteering,
    start: LocalMonth(2019, 04),
    end: LocalMonth(2020, 11),
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
  ),
  Activity(
    'Head/Co-Head of the MobileDev Club',
    ActivityType.volunteering,
    start: LocalMonth(2018, 11),
    end: LocalMonth(2021, 09),
    description:
        'I rebuilt the club from the ground up and organized weekly meetings. As part of the club, I organized a Google I/O Extended Event (2019) and Flutter, Material Design, Kotlin, and Git workshops. I also architected & co-designed the native HPI Android app and later on the Flutter app, as well as the backend.',
    primaryTag: PrimaryTag.hassoPlattnerInstitute,
    tags: {Tag.android, Tag.dart, Tag.flutter, Tag.kotlin},
  ),
  Activity(
    'WorldSkills Germany Jury Member & National Trainer',
    ActivityType.volunteering,
    isHighlight: true,
    start: LocalMonth(2018, 02),
    description:
        'Since 2018, I am part of the German jury and trainer team for the skill/discipline “IT Software Solutions for Business”.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.cSharp},
    links: {
      Link.homepage(Uri.parse('https://blz-it.de/en/skill09')),
      ..._germanItSkillsSocialLinks,
    },
  ),

  // Competition
  Activity(
    '🥉 Bronze Medal at the WorldSkills Abu Dhabi 2017',
    ActivityType.competition,
    isHighlight: true,
    start: LocalMonth(2017, 10),
    end: LocalMonth(2017, 10),
    description:
        'I won a bronze medal (first ever German medal in ICT skills) in the skill/discipline “IT Software Solutions for Business” at the WorldSkills Abu Dhabi 2017 among 27 countries/regions as the youngest competitor.',
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
        Uri.parse(
          'https://www.worldskillsgermany.com/hall-of-fame/worldskills/worldskills-abu-dhabi-2017/',
        ),
        "WorldSkills Germany's page about this event",
        icon: const Icon(Icons.web_outlined),
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
  ),
  Activity(
    'DOSUAS',
    ActivityType.competition,
    isHighlight: true,
    start: LocalMonth(2017, 12),
    end: LocalMonth(2018, 05),
    description:
        "DOSUAS is a device which uses acoustic signals for guiding blind people. We first take a 3D-picture of a camera mounted on the person's head, then convert it using different algorithms and finally output it on stereo-headphones. The distance is hereby represented by the pitch of the output – higher pitches correspond to something close, lower pitches to something more distant. We won the Konrad-Zuse youth prize by the Eduard Rhein Foundation at the national round of Jugend forscht.",
    primaryTag: PrimaryTag.jugendForscht,
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
  ),
  Activity(
    '🥉 Bronze Medal at the Albert Einstein Cup',
    ActivityType.competition,
    start: LocalMonth(2017, 06),
    end: LocalMonth(2017, 06),
    description:
        'I won the bronze medal (3rd place) at the European championship of WorldSkills in skill/discipline “IT Software Solutions for Business” among seven competitors.',
    primaryTag: PrimaryTag.worldSkills,
    tags: {Tag.android, Tag.cSharp, Tag.kotlin},
    links: {
      const Link.youTubeVideo('BsBxcwiwOeg', 'Video about this event'),
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
  ),
  Activity(
    '🥈 Silver Medal at the German championships',
    ActivityType.competition,
    start: LocalMonth(2017, 02),
    end: LocalMonth(2017, 02),
    description:
        'I won the silver medal (2nd place) at the German championship of WorldSkills in skill/discipline “IT Software Solutions for Business” among eight competitors.',
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
  ),
  Activity(
    'Mathematical Grammar School Cup',
    ActivityType.competition,
    start: LocalMonth(2016, 06),
    end: LocalMonth(2016, 06),
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
  ),

  // Project
  Activity(
    '🐛 debug_overlay',
    ActivityType.project,
    start: LocalMonth(2021, 03),
    description:
        'View debug infos and change settings via a central overlay for your app',
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'debug_overlay'),
      const Link.pubDev('debug_overlay'),
    },
  ),
  Activity(
    "Cap'n Proto for Dart",
    ActivityType.project,
    start: LocalMonth(2020, 12),
    end: LocalMonth(2021, 05),
    description:
        "Pure Dart implementation of Cap'n Proto – an extremely efficient protocol for sharing data and capabilities",
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'capnproto-dart'),
      const Link.pubDev('capnproto'),
    },
  ),
  Activity(
    '🍭 Candy',
    ActivityType.project,
    isHighlight: true,
    start: LocalMonth(2020, 06),
    description:
        "A sweet programming language that is robust, minimalistic, and expressive. We're creating this language from scratch.",
    tags: {Tag.rust},
    links: {const Link.gitHub('candy-lang', 'candy')},
  ),
  Activity(
    '🔟 data_size',
    ActivityType.project,
    start: LocalMonth(2020, 05),
    end: LocalMonth(2021, 03),
    description:
        'Customizable data size (bit & byte) formatting for interfacing with the user',
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'data_size'),
      const Link.pubDev('data_size'),
    },
  ),
  Activity(
    '🔁 rrule',
    ActivityType.project,
    start: LocalMonth(2020, 05),
    description:
        'Recurrence rule parsing & calculation as defined in the iCalendar RFC',
    tags: {Tag.dart},
    links: {
      const Link.gitHub('JonasWanke', 'rrule'),
      const Link.pubDev('rrule'),
    },
  ),
  Activity(
    '🔙 swipeable_page_route',
    ActivityType.project,
    start: LocalMonth(2020, 04),
    description:
        'Swipe to navigate back and admire beautifully morphing widgets',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'swipeable_page_route'),
      const Link.pubDev('swipeable_page_route'),
    },
  ),
  Activity(
    '🧭 flutter_deep_linking',
    ActivityType.project,
    start: LocalMonth(2020, 03),
    end: LocalMonth(2021, 04),
    description:
        'Handle all your routing with proper deep links and handle them declaratively!',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'flutter_deep_linking'),
      const Link.pubDev('flutter_deep_linking'),
    },
  ),
  Activity(
    '🌍 L42n – for even better L10n!',
    ActivityType.project,
    start: LocalMonth(2020, 03),
    end: LocalMonth(2020, 03),
    description: 'A desktop editor for .arb-files',
    tags: {Tag.dart, Tag.flutter},
    links: {const Link.gitHub('JonasWanke', 'l42n')},
  ),
  Activity(
    '🛠 black_hole_flutter',
    ActivityType.project,
    start: LocalMonth(2020, 03),
    description:
        'A package absorbing all Flutter utility functions, including extension functions and commonly used widgets',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'black_hole_flutter'),
      const Link.pubDev('black_hole_flutter'),
    },
  ),
  Activity(
    '📅 Timetable',
    ActivityType.project,
    isHighlight: true,
    start: LocalMonth(2020, 01),
    description:
        'Customizable flutter calendar widget including day and week views',
    tags: {Tag.dart, Tag.flutter},
    links: {
      const Link.gitHub('JonasWanke', 'timetable'),
      const Link.pubDev('timetable'),
    },
  ),
  Activity(
    '🦄 Unicorn',
    ActivityType.project,
    start: LocalMonth(2019, 01),
    end: LocalMonth(2020, 04),
    description: 'A tool to create, work on, test, and deploy projects',
    tags: {Tag.kotlin},
    links: {const Link.gitHub('JonasWanke', 'l42n')},
  ),
  Activity(
    'Homepage',
    ActivityType.project,
    start: LocalMonth(2017, 03),
    description: "You're looking at it!",
    tags: {Tag.dart, Tag.flutter},
    links: {const Link.gitHub('JonasWanke', 'homepage')},
  ),
  Activity(
    'Light your Dog',
    ActivityType.project,
    start: LocalMonth(2016, 11),
    end: LocalMonth(2018, 05),
    description:
        'Light your Dog developed illuminated dog harnesses as an alternative to lighted collars. The harness is fitted to the anatomy of the dog and is optionally customizable using an android app via bluetooth, e.g., for changing colors. With this project, we participated in the competition Jugend forscht.',
    primaryTag: PrimaryTag.jugendForscht,
    tags: {Tag.android, Tag.firebase, Tag.java},
    links: {
      const Link.instagram('lightyourdog'),
      const Link.twitter('LightYourDog'),
      Link.newspaperArticle(
        'Berliner Woche',
        Uri.parse(
          'https://www.berliner-woche.de/koepenick/c-bildung/jugend-forscht-hundegeschirr-bringt-bello-zum-leuchten_a119538',
        ),
      ),
    },
  ),
];

final _germanItSkillsSocialLinks = {
  const Link.youTubeChannel('GermanItSkills'),
  const Link.instagram('german.it.skills'),
  const Link.facebook('GermanItSkills'),
  const Link.twitter('GermanItSkills'),
};
final _dBildungscloudHomepageLink =
    Link.homepage(Uri.parse('https://dbildungscloud.de'));
