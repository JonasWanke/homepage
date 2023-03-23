import 'package:freezed_annotation/freezed_annotation.dart';

import 'brand_icon.dart';

part 'tag.freezed.dart';

abstract class BaseTag {
  String get title;
  String get description;
  BrandIcon get icon;
}

@freezed
class PrimaryTag extends BaseTag with _$PrimaryTag {
  const factory PrimaryTag(String title, String description, BrandIcon icon) =
      _PrimaryTag;

  static final values = [
    dBildungscloud,
    hassoPlattnerInstitute,
    jugendForscht,
    smusy,
    worldSkills,
  ];

  static const dBildungscloud = PrimaryTag(
    'dBildungscloud',
    'The dBildungscloud (formerly HPI Schul-Cloud) is a cloud solution for German schools.',
    BrandIcon.dBildungscloud,
  );
  static const hassoPlattnerInstitute = PrimaryTag(
    'Hasso Plattner Institute',
    'The Hasso Plattner Institute for Digital Engineering hosts the Digital Engineering Faculty of the University of Potsdam.',
    BrandIcon.hassoPlattnerInstitute,
  );
  static const jugendForscht = PrimaryTag(
    'Jugend forscht',
    'A German youth science competition',
    BrandIcon.jugendForscht,
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

@freezed
class Tag extends BaseTag with _$Tag {
  const factory Tag(String title, String description, BrandIcon icon) = _Tag;

  static final values = [
    flutter,
    dart,
    rust,
    terraform,
    googleCloudPlatform,
    android,
    kotlin,
    cSharp,
    java,
  ];

  static const android = Tag(
    'Android',
    'Android is a mobile operating system based on a modified version of the Linux kernel and other open-source software, designed primarily for touchscreen mobile devices such as smartphones and tablets',
    BrandIcon.android,
  );
  static const cSharp = Tag(
    'C#',
    'C# is a modern, object-oriented, and type-safe programming language',
    BrandIcon.cSharp,
  );
  static const dart = Tag(
    'Dart',
    'Dart is a client-optimized language for fast apps on any platform',
    BrandIcon.dart,
  );
  static const flutter = Tag(
    'Flutter',
    '“Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.”',
    BrandIcon.flutter,
  );
  static const googleCloudPlatform = Tag(
    'Google Cloud Platform',
    'Google Cloud Platform is a suite of cloud computing services offered by Google',
    BrandIcon.googleCloudPlatform,
  );
  static const java = Tag(
    'Java',
    'Java is a high-level, class-based, object-oriented programming language',
    BrandIcon.java,
  );
  static const kotlin = Tag(
    'Kotlin',
    'Kotlin is a cross-platform, general-purpose high-level programming language',
    BrandIcon.kotlin,
  );
  static const rust = Tag(
    'Rust',
    'Rust is a language empowering everyone to build reliable and efficient software',
    BrandIcon.rust,
  );
  static const terraform = Tag(
    'Terraform',
    'Terraform is an open-source infrastructure as code software tool',
    BrandIcon.terraform,
  );
}
