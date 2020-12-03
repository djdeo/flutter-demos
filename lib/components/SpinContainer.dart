import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinConatiner extends StatefulWidget {
  @override
  _SpinConatinerState createState() => _SpinConatinerState();
}

class _SpinConatinerState extends State<SpinConatiner>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(width: 100.0, height: 100.0, color: Colors.green[200]),
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
