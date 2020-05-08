import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PositionedVirusImageRotater extends HookWidgetBase {
  final double height;
  final double width;
  final bool animateToReverse;
  final double opacity;
  final Duration animationDuration;
  final Color color;

  PositionedVirusImageRotater(
      {this.height,
      this.width,
      this.opacity = .05,
      this.color = Colors.black,
      this.animationDuration = const Duration(seconds: 8),
      this.animateToReverse = false});

  @override
  Widget build(BuildContext context) {
    var coronaVirusController =
        useAnimationController(duration: animationDuration);
    coronaVirusController.repeat();
    return Positioned.fill(
      child: Center(
        child: RotationTransition(
          turns: _twen.animate(coronaVirusController),
          child: Image.asset(
            "assets/images/coronavirus.png",
            height: this.height ?? this.getHeight(percent: .3),
            width: this.width ?? this.getWidth(percent: .3),
            fit: BoxFit.contain,
            color: color.withOpacity(this.opacity),
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }

  Tween<double> get _twen {
    return this.animateToReverse
        ? Tween(begin: 1.0, end: 0.0)
        : Tween(begin: 0.0, end: 1.0);
  }
}
