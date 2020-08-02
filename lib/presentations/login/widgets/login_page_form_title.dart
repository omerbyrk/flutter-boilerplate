import 'package:flutter/material.dart';

import '../../../core/widgets/index.dart';


class LoginPageFormTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppFadeAnimation(
      duration: const Duration(milliseconds: 450),
      child: Center(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.lock,
            size: 30,
            color: Colors.black87,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "Login Form",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
