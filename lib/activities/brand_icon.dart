import '../app/_.dart';

enum BrandIcon {
  android(proportionalPadding: EdgeInsets.only(bottom: 0.1)),
  cSharp(),
  dart(proportionalPadding: EdgeInsets.all(0.1)),
  dBildungscloud(),
  facebook(),
  firebase(),
  flutter(),
  googleCloudPlatform(),
  googlePlay(),
  hassoPlattnerInstitute(proportionalPadding: EdgeInsets.all(0.15)),
  heinrichHertzGymnasium(),
  instagram(),
  java(),
  jugendForscht(proportionalPadding: EdgeInsets.all(0.1)),
  kotlin(
    proportionalPadding: EdgeInsets.only(left: 0.2, top: 0.1, bottom: 0.1),
  ),
  mathematicalGrammarSchool(),
  rust(),
  smusy(proportionalPadding: EdgeInsets.all(0.15)),
  terraform(proportionalPadding: EdgeInsets.all(0.1)),
  twitter(),
  worldSkills(),
  youTube();

  const BrandIcon({this.proportionalPadding = EdgeInsets.zero});

  final EdgeInsets proportionalPadding;
  Widget get widget {
    return ProportionalPadding(
      padding: proportionalPadding,
      child: Image.asset('assets/icons/$name.webp'),
    );
  }
}
