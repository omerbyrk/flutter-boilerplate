import 'package:flutter/material.dart';

import 'image_rotater.dart';
import 'widget_extension.dart';

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
          height: this.getHeight(context, percent: .6) * this.sizePercent,
          width: this.getWidth(context, percent: .6) * this.sizePercent,
          animationDuration: Duration(seconds: 8),
          opacity: .2,
          color: color,
        ),
        ImageRotater(
          imagePath: "assets/images/progress.png",
          height: this.getHeight(context, percent: .3) * this.sizePercent,
          width: this.getWidth(context, percent: .3) * this.sizePercent,
          animationDuration: Duration(seconds: 5),
          opacity: 0.3,
          color: color,
          animateToReverse: true,
        ),
        ImageRotater(
          imagePath: "assets/images/progress.png",
          height: this.getHeight(context, percent: .1) * this.sizePercent,
          width: this.getWidth(context, percent: .1) * this.sizePercent,
          opacity: 0.4,
          color: color,
          animationDuration: Duration(seconds: 3),
        ),
      ],
    );
  }
}
