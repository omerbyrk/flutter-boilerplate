import 'package:flutter/material.dart';

class SplashPageSignature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Covid APP Example",
      style: TextStyle(
          color: Colors.white38,
          fontFamily: "Flamenco",
          fontWeight: FontWeight.bold,
          fontSize: 35),
    ));
  }
}
