import 'package:covid19_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/widget_extension.dart';

// ignore: must_be_immutable
class SplashPageMessageWidget extends StatelessWidget {
  
  String message;
  final List<String> messageSuffixes = [".", "..", "..."];

  SplashPageMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
        return Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: state.twenEnd),
            onEnd: () {
              context.bloc<SplashCubit>().setTweenEnd(state.twenEnd + 3);
            },
            duration: Duration(milliseconds: 1000),
            builder: (_, number, child) {
              this.doDelayedTask(() {
                context.bloc<SplashCubit>().setMessage(
                    this.message + this.messageSuffixes[number.floor() % 3]);
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
    );
  }
}
