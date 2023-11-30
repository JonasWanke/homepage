import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:supernova_flutter/supernova_flutter.dart';

class ChipGroup extends StatelessWidget {
  const ChipGroup({
    super.key,
    this.alignment = WrapSuperAlignment.left,
    required this.children,
  });

  final WrapSuperAlignment alignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return WrapSuper(
      alignment: alignment,
      spacing: 8,
      lineSpacing: switch (context.theme.materialTapTargetSize) {
        MaterialTapTargetSize.padded => 0,
        MaterialTapTargetSize.shrinkWrap => 8,
      },
      children: children,
    );
  }
}
