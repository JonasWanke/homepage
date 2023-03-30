import 'brand_icon.dart';

abstract class BaseTag {
  const BaseTag(this.icon, this.title, this.description);

  final String title;
  final String description;
  final BrandIcon icon;
}

class PrimaryTag extends BaseTag {
  const PrimaryTag(super.icon, super.title, super.description);

  // Sorted alphabetically
  static final values = [
    dBildungscloud,
    hassoPlattnerInstitute,
    jugendForscht,
    mathematicalGrammarSchoolCup,
    smusy,
    worldSkills,
  ];

  static const dBildungscloud = PrimaryTag(
    BrandIcon.dBildungscloud,
    'dBildungscloud',
    'The dBildungscloud (formerly HPI Schul-Cloud) is a cloud solution for German schools.',
  );
  static const hassoPlattnerInstitute = PrimaryTag(
    BrandIcon.hassoPlattnerInstitute,
    'Hasso Plattner Institute',
    'The Hasso Plattner Institute for Digital Engineering hosts the Digital Engineering Faculty of the University of Potsdam, Germany.',
  );
  static const jugendForscht = PrimaryTag(
    BrandIcon.jugendForscht,
    'Jugend forscht',
    'Jugend forscht is an annual German youth STEM competition.',
  );
  static const mathematicalGrammarSchoolCup = PrimaryTag(
    BrandIcon.mathematicalGrammarSchool,
    'Mathematical Grammar School Cup',
    'The Mathematical Grammar School Cup is a competition in mathematics, physics, and computer science, hosted by the Mathematical Grammar School in Belgrade, Serbia.',
  );
  static const smusy = PrimaryTag(
    BrandIcon.smusy,
    'smusy.',
    'smusy. aims to revolutionize the application process for students.',
  );
  static const worldSkills = PrimaryTag(
    BrandIcon.worldSkills,
    'WorldSkills',
    'The WorldSkills Competition (comparable to the Olympics) is held every two years and is the biggest vocational education and skills excellence event in the world.',
  );
}

class Tag extends BaseTag {
  const Tag(super.icon, super.title, super.description);

  // Sorted by importance
  static final values = [
    flutter,
    dart,
    rust,
    terraform,
    googleCloudPlatform,
    firebase,
    android,
    kotlin,
    cSharp,
    java,
  ];

  static const android = Tag(
    BrandIcon.android,
    'Android',
    'Android is a mobile operating system based on a modified version of the Linux kernel and other open-source software, designed primarily for touchscreen mobile devices such as smartphones and tablets',
  );
  static const cSharp = Tag(
    BrandIcon.cSharp,
    'C#',
    'C# is a modern, object-oriented, and type-safe programming language',
  );
  static const dart = Tag(
    BrandIcon.dart,
    'Dart',
    'Dart is a client-optimized language for fast apps on any platform',
  );
  static const flutter = Tag(
    BrandIcon.flutter,
    'Flutter',
    '“Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.”',
  );
  static const firebase = Tag(
    BrandIcon.firebase,
    'Firebase',
    'Firebase is an app development platform by Google for building and growing apps and games.',
  );
  static const googleCloudPlatform = Tag(
    BrandIcon.googleCloudPlatform,
    'Google Cloud Platform',
    'Google Cloud Platform is a suite of cloud computing services offered by Google',
  );
  static const java = Tag(
    BrandIcon.java,
    'Java',
    'Java is a high-level, class-based, object-oriented programming language',
  );
  static const kotlin = Tag(
    BrandIcon.kotlin,
    'Kotlin',
    'Kotlin is a cross-platform, general-purpose high-level programming language',
  );
  static const rust = Tag(
    BrandIcon.rust,
    'Rust',
    'Rust is a language empowering everyone to build reliable and efficient software',
  );
  static const terraform = Tag(
    BrandIcon.terraform,
    'Terraform',
    'Terraform is an open-source infrastructure as code software tool',
  );
}
