import 'package:covid19_app/core/consts/enums.dart';
import 'package:covid19_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/index.dart';

class LoginPageFormTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppFadeAnimation(
      duration: const Duration(milliseconds: 800),
      child: Center(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.lock_outline,
            size: this.getIconSize(SizeType.xLarge),
            color: AppColors.navyBlue,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            this.t("lp_title"),
            style: TextStyle(
                color: AppColors.black,
                fontSize: this.getFontSize(SizeType.xxLarge),
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
