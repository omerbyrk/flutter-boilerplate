import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
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
                      bottom: this.getHeight(context, percent: .07)),
                  child: Column(
                    children: <Widget>[
                      SplashPageMessageWidget(message),
                      SizedBox(
                        height: this.convertSize(75.0),
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
