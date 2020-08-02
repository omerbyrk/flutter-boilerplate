import 'package:flutter/cupertino.dart';

class AppFadeAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AppFadeAnimation(
      {Key key,
      this.duration = const Duration(seconds: 1),
      this.curve = Curves.easeOut,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: this.duration,
        curve: this.curve,
        builder: (_, doubleValue, child) {
          return Transform.translate(
              offset: Offset(0.0, (doubleValue - 1) * -30),
              child: Opacity(
                child: child,
                opacity: doubleValue,
              ));
        },
        child: this.child);
  }
}
