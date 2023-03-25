import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app/_.dart';

enum BrandIcon {
  android(proportionalPadding: EdgeInsets.only(bottom: 0.1)),
  cSharp(),
  dart(proportionalPadding: EdgeInsets.all(0.1)),
  dBildungscloud(),
  facebook(),
  firebase(),
  flutter(),
  gitHub(widget: Icon(FontAwesomeIcons.github)),
  gitHubActions(proportionalPadding: EdgeInsets.all(0.1)),
  googleCloudPlatform(),
  googlePlay(),
  grpc(),
  hassoPlattnerInstitute(proportionalPadding: EdgeInsets.all(0.15)),
  instagram(),
  java(proportionalPadding: EdgeInsets.only(bottom: 0.1)),
  jira(),
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

  const BrandIcon({Widget? widget, this.proportionalPadding = EdgeInsets.zero})
      : _widget = widget;

  final Widget? _widget;
  final EdgeInsets proportionalPadding;
  Widget get widget {
    return ProportionalPadding(
      padding: proportionalPadding,
      child: _widget ?? Image.asset('assets/icons/$name.webp'),
    );
  }
}
