import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dartx/dartx.dart';
import 'package:collection/collection.dart';

class KonamiWrapper extends StatefulWidget {
  const KonamiWrapper({@required this.child});

  final Widget child;

  @override
  _KonamiWrapperState createState() => _KonamiWrapperState();
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
  final _events = <RawKeyEvent>[];

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _addEvent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * math.pi * 2,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  void _addEvent(RawKeyEvent event) {
    if (event is! RawKeyDownEvent) return;
    _events.add(event);
    if (_events.length < _code.length) return;

    final filtered = _events.takeLast(_code.length).map((it) => it.logicalKey);
    if (!DeepCollectionEquality().equals(filtered, _code)) return;

    _controller.reset();
    _controller.forward();
  }
}
