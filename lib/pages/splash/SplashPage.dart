import 'package:covid19_app/components/AppCircularProgressIndicator.dart';
import 'package:covid19_app/components/AppLogoImage.dart';
import 'package:covid19_app/pages/WidgetExtension.dart';
import 'package:covid19_app/pages/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  String message;
  final List<String> messageSuffixes = [".", "..", "..."];

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
                Padding(
                  padding: EdgeInsets.only(
                      top: this.getHeight(context, percent: .05)),
                  child: AppLogoImage(
                    height: 250,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: this.getHeight(context, percent: .10)),
                  child: Column(
                    children: <Widget>[
                      BlocProvider(
                        create: (_) => SplashCubit(),
                        child: BlocBuilder<SplashCubit, SplashState>(
                            builder: (context, state) {
                          return Center(
                            child: TweenAnimationBuilder<double>(
                              tween:
                                  Tween<double>(begin: 0, end: state.twenEnd),
                              onEnd: () {
                                context
                                    .bloc<SplashCubit>()
                                    .setTweenEnd(state.twenEnd + 3);
                              },
                              duration: Duration(milliseconds: 1000),
                              builder: (_, number, child) {
                                this.doDelayedTask(() {
                                  context.bloc<SplashCubit>().setMessage(this
                                          .message +
                                      this.messageSuffixes[number.floor() % 3]);
                                });
                                return child;
                              },
                              child: Container(
                                child: Text(
                                  state.message,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: "Flamenco",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          );
                        }),
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
