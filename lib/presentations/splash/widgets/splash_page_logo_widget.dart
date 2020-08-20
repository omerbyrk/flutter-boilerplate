import 'package:flutter/material.dart';

import '../../../core/widgets/app_logo_image.dart';
import '../../../core/widgets/app_widget_extension.dart';

class SplashPageLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: convertSize(20)),
      child: AppLogoImage(
        height: this.convertSize(200),
        width: this.convertSize(200),
      ),
    );
  }
}
