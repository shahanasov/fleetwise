import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  final Color color;
  const AnimatedLogo({super.key, required this.color});

  @override
  AnimatedLogoState createState() => AnimatedLogoState();
}

class AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Create a controller for the rotation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(); // repeat the animation forever
  }

  @override
  void dispose() {
    _controller.dispose(); // clean up
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: Image.asset("asset/images/fleetlogo.png", color: widget.color),
    );
  }
}
