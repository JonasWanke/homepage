// ignore_for_file: lines_longer_than_80_chars

import 'brand_icon.dart';

abstract class BaseTag {
  const BaseTag(this.title, this.description, this.icon);

  final String title;
  final String description;
  final BrandIcon? icon;
}

class PrimaryTag extends BaseTag {
  const PrimaryTag(super.title, super.description, super.icon);

  // Sorted alphabetically
  static final values = [
    aGym,
    dBildungscloud,
    hassoPlattnerInstitute,
    jugendForscht,
    mathematicalGrammarSchoolCup,
    smusy,
    worldSkills,
  ];

  static const aGym = PrimaryTag('aGYM', 'Coming soon', BrandIcon.aGym);
  static const dBildungscloud = PrimaryTag(
    'dBildungscloud',
    'The dBildungscloud (formerly HPI Schul-Cloud) is a cloud solution for German schools.',
    BrandIcon.dBildungscloud,
  );
  static const hassoPlattnerInstitute = PrimaryTag(
    'Hasso Plattner Institute',
    'The Hasso Plattner Institute for Digital Engineering hosts the Digital Engineering Faculty of the University of Potsdam, Germany.',
    BrandIcon.hassoPlattnerInstitute,
  );
  static const heinrichHertzGymnasium = PrimaryTag(
    'Heinrich-Hertz-Gymnasium',
    'The Heinrich-Hertz-Gymnasium is a high school (“Gymnasium”) with mathematical and scientific specialization in Berlin, Germany.',
    BrandIcon.heinrichHertzGymnasium,
  );
  static const jugendForscht = PrimaryTag(
    'Jugend forscht',
    'Jugend forscht is an annual German youth STEM competition.',
    BrandIcon.jugendForscht,
  );
  static const mathematicalGrammarSchoolCup = PrimaryTag(
    'Mathematical Grammar School Cup',
    'The Mathematical Grammar School Cup is a competition in mathematics, physics, and computer science, hosted by the Mathematical Grammar School in Belgrade, Serbia.',
    BrandIcon.mathematicalGrammarSchool,
  );
  static const smusy = PrimaryTag(
    'smusy.',
    'smusy. aims to revolutionize the application process for students.',
    BrandIcon.smusy,
  );
  static const worldSkills = PrimaryTag(
    'WorldSkills',
    'The WorldSkills Competition (comparable to the Olympics) is held every two years and is the biggest vocational education and skills excellence event in the world.',
    BrandIcon.worldSkills,
  );
}

class Tag extends BaseTag {
  const Tag(super.title, super.description, [super.icon]);

  // Sorted by importance
  static final values = [
    rust,
    flutter,
    dart,
    terraform,
    googleCloudPlatform,
    firebase,
    gitHub,
    gitHubActions,
    grpc,
    protocolBuffers,
    android,
    kotlin,
    cSharp,
    java,
  ];

  static const android = Tag(
    'Android',
    'Android is a mobile operating system based on open-source software.',
    BrandIcon.android,
  );
  static const cSharp = Tag(
    'C#',
    'C# is a modern, object-oriented, and type-safe programming language.',
    BrandIcon.cSharp,
  );
  static const dart = Tag(
    'Dart',
    'Dart is a client-optimized language for fast apps on any platform.',
    BrandIcon.dart,
  );
  static const flutter = Tag(
    'Flutter',
    'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.',
    BrandIcon.flutter,
  );
  static const firebase = Tag(
    'Firebase',
    'Firebase is an app development platform by Google for building and growing apps and games.',
    BrandIcon.firebase,
  );
  static const gitHub = Tag(
    'GitHub',
    'GitHub is a hosting service for software development and version control using Git plus bug tracking, software feature requests, task management, continuous integration, and wikis.',
    BrandIcon.gitHub,
  );
  static const gitHubActions = Tag(
    'GitHub Actions',
    'GitHub Actions makes it easy to automate software workflows by providing a CI/CD platform right from GitHub.',
    BrandIcon.gitHubActions,
  );
  static const googleCloudPlatform = Tag(
    'Google Cloud Platform',
    'Google Cloud Platform is a suite of cloud computing services offered by Google.',
    BrandIcon.googleCloudPlatform,
  );
  static const grpc = Tag(
    'gRPC',
    'gRPC is a high performance, open source universal RPC framework by Google.',
    BrandIcon.grpc,
  );
  static const java = Tag(
    'Java',
    'Java is a high-level, class-based, object-oriented programming language.',
    BrandIcon.java,
  );
  static const jira = Tag(
    'Jira',
    'Jira is a platform for planning, tracking, and managing agile and software development projects.',
    BrandIcon.jira,
  );
  static const kotlin = Tag(
    'Kotlin',
    'Kotlin is a cross-platform, general-purpose high-level programming language.',
    BrandIcon.kotlin,
  );
  static const protocolBuffers = Tag(
    'Protocol Buffers',
    'Protocol Buffers are a language-neutral, platform-neutral extensible mechanism for serializing structured data, developed by Google.',
  );
  static const rust = Tag(
    'Rust',
    'Rust is a language empowering everyone to build reliable and efficient software',
    BrandIcon.rust,
  );
  static const terraform = Tag(
    'Terraform',
    'Terraform is an open-source infrastructure as code software tool.',
    BrandIcon.terraform,
  );
}
