import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoFocusedChip extends StatelessWidget {
  final String title;
  final String info;
  final Color color;
  final Color textColor;

  InfoFocusedChip(this.title, this.info,
      {this.color: Colors.black, this.textColor: Colors.white70});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color.withOpacity(.25),
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
          ),
          Text(
            info,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w700, fontSize: 20),
          )
        ],
      ),
    );
  }
}
