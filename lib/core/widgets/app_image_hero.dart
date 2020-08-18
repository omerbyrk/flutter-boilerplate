import 'package:flutter/material.dart';

class AppImageHero extends StatelessWidget {
  final String path;

  const AppImageHero({Key key, this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: path,
      child: Image.network(
        path,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
