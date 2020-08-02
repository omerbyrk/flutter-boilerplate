import 'package:flutter/material.dart';

import '../../../../core/extensions/widget_extension.dart';
import '../../../../core/widgets/app_logo_image.dart';

class SplashPageLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: this.getHeight(context, percent: .05)),
      child: AppLogoImage(
        height: 250,
        width: 250,
      ),
    );
  }
}
