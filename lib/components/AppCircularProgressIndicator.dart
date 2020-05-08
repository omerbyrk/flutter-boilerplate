import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:flutter/material.dart';

import 'PositionedVirusImageRotater.dart';

class AppCircularProgressIndicator extends HookWidgetBase {
  final Color color;
  final double sizePercent;

  AppCircularProgressIndicator(
      {this.color = Colors.black, this.sizePercent = 1});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PositionedVirusImageRotater(
          height: this.getHeight(percent: .6) * this.sizePercent,
          width: this.getWidth(percent: .6) * this.sizePercent,
          opacity: .2,
          color: color,
        ),
        PositionedVirusImageRotater(
          height: this.getHeight(percent: .3) * this.sizePercent,
          width: this.getWidth(percent: .3) * this.sizePercent,
          animationDuration: Duration(seconds: 5),
          opacity: 0.3,
          color: color,
          animateToReverse: true,
        ),
        PositionedVirusImageRotater(
          height: this.getHeight(percent: .1) * this.sizePercent,
          width: this.getWidth(percent: .1) * this.sizePercent,
          opacity: 0.4,
          color: color,
          animationDuration: Duration(seconds: 3),
        ),
      ],
    );
  }
}
