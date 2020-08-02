import 'package:flutter/material.dart';

import '../../../../core/extensions/widget_extension.dart';
import '../../../../core/widgets/app_circular_progress_indicator.dart';
import '../widgets/widgets.dart';

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
            end: Alignment.centerRight,
            colors: [
              Colors.purple[800],
              Colors.purple[200],
              Colors.purple[600]
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            AppCircularProgressIndicator(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LogoWidget(),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: this.getHeight(context, percent: .10)),
                  child: Column(
                    children: <Widget>[
                      MessageWidget(message),
                      SizedBox(
                        height: 75.0,
                      ),
                      AppSignature()
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
