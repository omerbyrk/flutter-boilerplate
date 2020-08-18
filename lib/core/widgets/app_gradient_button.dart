import 'package:flutter/material.dart';

import '../consts/enums.dart';
import '../theme/app_colors.dart';
import 'index.dart';

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.convertSize(10))),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: this.convertSize(10.0)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.radius),
            gradient: this._gradient,
          ),
          child: Center(
            child: Text(
              this.buttonText,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: this.getFontSize(SizeType.Middle),
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
        AppColors.red[300],
        AppColors.red[800],
        AppColors.red[600],
      ],
    );
  }
}
