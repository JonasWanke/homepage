import 'brand_icon.dart';

enum Tag {
  // Education
  hassoPlattnerInstitute(
    'Hasso Plattner Institute',
    'The Hasso Plattner Institute for Digital Engineering hosts the Digital Engineering Faculty of the University of Potsdam.',
    BrandIcon.hassoPlattnerInstitute,
  ),

  // Work
  smusy(
    'smusy.',
    'smusy. aims to revolutionize the application process for students.',
    BrandIcon.smusy,
  ),
  dBildungscloud(
    'dBildungscloud',
    'The dBildungscloud (formerly HPI Schul-Cloud) is a cloud solution for German schools.',
    BrandIcon.dBildungscloud,
  ),

  // Volunteering
  worldSkills(
    'WorldSkills',
    'The WorldSkills Competition is held every two years and is the biggest vocational education and skills excellence event in the world.',
    BrandIcon.worldSkills,
  ),

  // Competitions
  jugendForscht(
    'Jugend forscht',
    'A German youth science competition',
    BrandIcon.jugendForscht,
  ),

  // Project

  // Other
  flutter(
    'Flutter',
    '“Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.”',
    BrandIcon.flutter,
  ),
  dart(
    'Dart',
    'Dart is a client-optimized language for fast apps on any platform',
    BrandIcon.dart,
  ),
  rust(
    'Rust',
    'Rust is a language empowering everyone to build reliable and efficient software',
    BrandIcon.rust,
  ),
  terraform(
    'Terraform',
    'Terraform is an open-source infrastructure as code software tool',
    BrandIcon.terraform,
  ),
  googleCloudPlatform(
    'Google Cloud Platform',
    'Google Cloud Platform is a suite of cloud computing services offered by Google',
    BrandIcon.googleCloudPlatform,
  ),
  android(
    'Android',
    'Android is a mobile operating system based on a modified version of the Linux kernel and other open-source software, designed primarily for touchscreen mobile devices such as smartphones and tablets',
    BrandIcon.android,
  ),
  kotlin(
    'Kotlin',
    'Kotlin is a cross-platform, general-purpose high-level programming language',
    BrandIcon.kotlin,
  ),
  cSharp(
    'C#',
    'C# is a modern, object-oriented, and type-safe programming language',
    BrandIcon.cSharp,
  ),
  java(
    'Java',
    'Java is a high-level, class-based, object-oriented programming language',
    BrandIcon.java,
  );

  const Tag(this.title, this.tooltip, this.icon);

  final String title;
  final String tooltip;
  final BrandIcon icon;
}
