import 'package:flutter/material.dart';

import 'image_rotater.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double sizePercent;

  AppCircularProgressIndicator(
      {this.color = Colors.black, this.sizePercent = 1});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ImageRotater(
          imagePath: "assets/images/progress.png",
          sizePercent: this.sizePercent,
          animationDuration: Duration(seconds: 8),
          opacity: .2,
          color: color,
        ),
        ImageRotater(
          imagePath: "assets/images/progress.png",
          sizePercent: this.sizePercent / 2,
          animationDuration: Duration(seconds: 5),
          opacity: 0.3,
          color: color,
          animateToReverse: true,
        ),
        ImageRotater(
          imagePath: "assets/images/progress.png",
          opacity: 0.4,
          sizePercent: this.sizePercent / 4,
          color: color,
          animationDuration: Duration(seconds: 3),
        ),
      ],
    );
  }
}
