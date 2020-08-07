import 'package:covid19_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/widget_extension.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import '../widgets/index.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  String message;

  SplashPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: this.getHeight(context),
        width: this.getWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.red[300],
              AppColors.red[900],
              AppColors.red[600]
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            AppCircularProgressIndicator(
              color: AppColors.white,
              sizePercent: .6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SplashPageLogoWidget(),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: this.getHeight(context, percent: .10)),
                  child: Column(
                    children: <Widget>[
                      SplashPageMessageWidget(message),
                      SizedBox(
                        height: 75.0,
                      ),
                      SplashPageSignature()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
