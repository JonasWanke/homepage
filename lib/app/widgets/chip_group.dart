import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';

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
    final double lineSpacing;
    switch (context.theme.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        lineSpacing = 0;
        break;
      case MaterialTapTargetSize.shrinkWrap:
        lineSpacing = 8;
        break;
    }
    return WrapSuper(
      alignment: alignment,
      spacing: 8,
      lineSpacing: lineSpacing,
      children: children,
    );
  }
}
