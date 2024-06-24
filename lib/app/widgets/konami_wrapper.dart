import 'dart:math' as math;

import 'package:supernova_flutter/supernova_flutter.dart';

class KonamiWrapper extends StatefulWidget {
  const KonamiWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<KonamiWrapper> createState() => _KonamiWrapperState();
}

class _KonamiWrapperState extends State<KonamiWrapper>
    with SingleTickerProviderStateMixin {
  static final _code = [
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.keyB,
    LogicalKeyboardKey.keyA,
  ];
  final _focusNode = FocusNode()..requestFocus();
  final _events = <KeyEvent>[];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _addEvent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: Curves.easeInOut.transform(_controller.value) * math.pi * 2,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  void _addEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return;
    _events.add(event);
    if (_events.length < _code.length) return;

    final filtered = _events.takeLast(_code.length).map((it) => it.logicalKey);
    if (!const DeepCollectionEquality().equals(filtered, _code)) return;

    _controller
      ..reset()
      ..forward();
  }
}
