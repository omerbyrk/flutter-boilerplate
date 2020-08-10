import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppLogoImage extends StatelessWidget {
  final double width;
  final double height;
  final bool inAnimated;
  AppLogoImage({this.width = 200, this.height = 200, this.inAnimated = true});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: _tween,
      duration: Duration(milliseconds: 1000),
      curve: Curves.bounceOut,
      builder: (_, scale, child) {
        return Transform.translate(
          offset: Offset(0, -100 * scale),
          child: child,
        );
      },
      child: Image.asset(
        "assets/images/logo.png",
        height: this.height,
        width: this.width,
        color: AppColors.white,
        fit: BoxFit.contain,
      ),
    );
  }

  Tween<double> get _tween {
    return this.inAnimated
        ? Tween<double>(begin: -1.0, end: 0)
        : Tween<double>(begin: 0, end: 0);
  }
}
