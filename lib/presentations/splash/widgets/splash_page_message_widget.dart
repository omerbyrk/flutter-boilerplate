import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/consts/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_widget_extension.dart';
import '../cubit/splash_cubit.dart';

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
                style: GoogleFonts.bitter(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: this.getFontSize(SizeType.Middle)),
              ),
            ),
          ),
        );
      }),
    );
  }
}
