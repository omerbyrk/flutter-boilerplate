import 'package:flutter/material.dart';

class AppGradientButton extends StatelessWidget {
  final Gradient gradient;
  final void Function() onTap;
  final String buttonText;
  final double radius;

  const AppGradientButton(
      {Key key, this.gradient, this.onTap, this.buttonText, this.radius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Material(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.radius),
            gradient: this._gradient,
          ),
          child: Center(
            child: Text(
              this.buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Gradient get _gradient {
    if (this.gradient != null) return this.gradient;
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Colors.purple[200],
        Colors.purple[500],
        Colors.purple[700],
      ],
    );
  }
}
