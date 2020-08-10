import 'package:flutter/material.dart';

import 'image_rotater.dart';
import 'index.dart';

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
          imagePath: "assets/images/progress.ico",
          sizePercent: this.sizePercent,
          animationDuration: Duration(milliseconds: 7500),
          opacity: .2,
          color: color,
        ),
        ImageRotater(
          imagePath: "assets/images/progress.ico",
          opacity: .5,
          sizePercent: this.sizePercent / this.convertSize(4),
          color: color,
          animateToReverse: true,
          animationDuration: Duration(milliseconds: 1250),
        ),
      ],
    );
  }
}
