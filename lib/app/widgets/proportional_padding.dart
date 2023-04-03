import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProportionalPadding extends SingleChildRenderObjectWidget {
  const ProportionalPadding({
    super.key,
    required this.padding,
    required super.child,
  });

  final EdgeInsets padding;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      ProportionalPaddingRenderObject(padding: padding);

  @override
  void updateRenderObject(
    BuildContext context,
    ProportionalPaddingRenderObject renderObject,
  ) {
    renderObject._padding = padding;
  }
}

class ProportionalPaddingRenderObject extends RenderShiftedBox {
  ProportionalPaddingRenderObject({required EdgeInsets padding})
      : _padding = padding,
        super(null);

  EdgeInsets _padding;
  EdgeInsets get padding => _padding;
  set padding(EdgeInsets value) {
    if (_padding == value) {
      return;
    }

    _padding = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) =>
      child!.getMinIntrinsicWidth(height) * (padding.horizontal + 1);
  @override
  double computeMaxIntrinsicWidth(double height) =>
      child!.getMaxIntrinsicWidth(height) * (padding.horizontal + 1);
  @override
  double computeMinIntrinsicHeight(double width) =>
      child!.getMinIntrinsicHeight(width) * (padding.vertical + 1);
  @override
  double computeMaxIntrinsicHeight(double width) =>
      child!.getMaxIntrinsicHeight(width) * (padding.vertical + 1);

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final innerConstraints =
        constraints.deflate(_resolvePadding(constraints.biggest));
    final childSize = child!.getDryLayout(innerConstraints);
    return constraints.constrain(Size(
      childSize.width * (padding.horizontal + 1),
      childSize.height * (padding.vertical + 1),
    ));
  }

  @override
  void performLayout() {
    final innerConstraints =
        constraints.deflate(_resolvePadding(constraints.biggest));
    child!.layout(innerConstraints, parentUsesSize: true);

    final childParentData = child!.parentData! as BoxParentData;
    final resolvedPadding = _resolvePadding(child!.size);
    childParentData.offset = resolvedPadding.topLeft;
    size = constraints.constrain(Size(
      child!.size.width + resolvedPadding.horizontal,
      child!.size.height + resolvedPadding.vertical,
    ));
  }

  EdgeInsets _resolvePadding(Size size) {
    // Conditionals are necessary to avoid NaNs.
    return EdgeInsets.fromLTRB(
      padding.left == 0
          ? 0
          : size.width * padding.left / (padding.horizontal + 1),
      padding.top == 0 ? 0 : size.height * padding.top / (padding.vertical + 1),
      padding.right == 0
          ? 0
          : size.width * padding.right / (padding.horizontal + 1),
      padding.bottom == 0
          ? 0
          : size.height * padding.bottom / (padding.vertical + 1),
    );
  }
}
