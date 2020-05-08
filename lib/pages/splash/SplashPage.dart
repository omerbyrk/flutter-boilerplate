import 'package:covid19_app/components/AppCircularProgressIndicator.dart';
import 'package:covid19_app/components/AppLogoImage.dart';
import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashPage extends HookWidgetBase {
  String message;
  final List<String> messageSuffixes = [".", "..", "..."];

  SplashPage(this.message);

  @override
  Widget build(BuildContext context) {
    var message = useState("");
    var tweenEnd = useState(3.0);

    return Scaffold(
      body: Container(
        height: this.getHeight(),
        width: this.getWidth(),
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
                Padding(
                  padding: EdgeInsets.only(top: this.getHeight(percent: .05)),
                  child: AppLogoImage(
                    height: 250,
                    width: 250,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: this.getHeight(percent: .10)),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0, end: tweenEnd.value),
                          onEnd: () {
                            tweenEnd.value += 3.0;
                          },
                          duration: Duration(milliseconds: 1000),
                          builder: (_, number, child) {
                            this.doDelayedTask(() {
                              message.value = this.message +
                                  this.messageSuffixes[number.floor() % 3];
                            });
                            return child;
                          },
                          child: Container(
                            child: Text(
                              message.value,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: "Flamenco",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 75.0,
                      ),
                      Center(
                          child: Text(
                        "Covid APP Example",
                        style: TextStyle(
                            color: Colors.white38,
                            fontFamily: "Flamenco",
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      )),
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
