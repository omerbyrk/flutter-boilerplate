import 'package:flutter/material.dart';

import '../../../core/widgets/index.dart';


class LoginPageTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyBottomCLipper(),
      child: Container(
        height: this.getHeight(context, percent: .45),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.purple[800],
              Colors.purple[300],
              Colors.purple[600]
            ],
          ),
        ),
        child: Center(
          child: AppFadeAnimation(
            duration: Duration(milliseconds: 300),
            child: AppLogoImage(
              width: 250,
              height: 250,
              inAnimated: false,
            ),
          ),
        ),
      ),
    );
  }
}