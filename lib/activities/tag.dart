import '../app/_.dart';

enum Tag {
  worldSkills(
    'WorldSkills',
    'The WorldSkills Competition is held every two years and is the biggest vocational education and skills excellence event in the world.',
    icon: Image(image: AssetImage('assets/icons/worldSkills.webp')),
  ),
  jugendForscht(
    'Jugend forscht',
    'A German youth science competition',
    icon: ProportionalPadding(
      padding: EdgeInsets.all(0.1),
      child: Image(image: AssetImage('assets/icons/jugendForscht.webp')),
    ),
  ),
  flutter(
    'Flutter',
    '“Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.”',
    icon: ProportionalPadding(
      padding: EdgeInsets.only(top: 0.1, right: 0.1, bottom: 0.1),
      child: Image(image: AssetImage('assets/icons/flutter.webp')),
    ),
  ),
  dart(
    'Dart',
    'Dart is a client-optimized language for fast apps on any platform',
    icon: ProportionalPadding(
      padding: EdgeInsets.all(0.1),
      child: Image(image: AssetImage('assets/icons/dart.webp')),
    ),
  ),
  rust(
    'Rust',
    'Rust is a language empowering everyone to build reliable and efficient software',
    icon: Image(image: AssetImage('assets/icons/rust.webp')),
  ),
  android(
    'Android App',
    'An app written for Android',
    icon: ProportionalPadding(
      padding: EdgeInsets.only(bottom: 0.1),
      child: Image(image: AssetImage('assets/icons/android.webp')),
    ),
  ),
  kotlin(
    'Kotlin',
    'Kotlin is a cross-platform, general-purpose high-level programming language',
    icon: ProportionalPadding(
      padding: EdgeInsets.only(left: 0.25, top: 0.2, bottom: 0.2),
      child: Image(image: AssetImage('assets/icons/kotlin.webp')),
    ),
  ),
  cSharp(
    'C#',
    'C# is a modern, object-oriented, and type-safe programming language',
    icon: Image(image: AssetImage('assets/icons/cSharp.webp')),
  );

  const Tag(this.title, this.tooltip, {required this.icon});

  final String title;
  final String tooltip;
  final Widget icon;
}
