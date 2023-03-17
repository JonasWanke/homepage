import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
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
    return WrapSuper(
      alignment: alignment,
      spacing: 8,
      lineSpacing: 8,
      children: children,
    );
  }
}
