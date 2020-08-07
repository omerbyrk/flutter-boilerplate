import 'package:flutter/material.dart';

import 'widget_extension.dart';

class ImageRotater extends StatefulWidget {
  final double sizePercent;
  final bool animateToReverse;
  final double opacity;
  final Duration animationDuration;
  final Color color;
  final String imagePath;

  const ImageRotater(
      {Key key,
      this.sizePercent = 0.5,
      this.animateToReverse = false,
      this.opacity = 1,
      @required this.animationDuration,
      @required this.color,
      @required this.imagePath})
      : super(key: key);

  @override
  _ImageRotaterState createState() => _ImageRotaterState();
}

class _ImageRotaterState extends State<ImageRotater>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: RotationTransition(
          turns: _twen.animate(_controller),
          child: SizedBox(
            child: Image.asset(
              this.widget.imagePath,
              height: this
                  .widget
                  .getHeight(context, percent: this.widget.sizePercent),
              width: this
                  .widget
                  .getWidth(context, percent: this.widget.sizePercent),
              color: this.widget.color.withOpacity(this.widget.opacity),
            ),
          ),
        ),
      ),
    );
  }

  Tween<double> get _twen {
    return this.widget.animateToReverse
        ? Tween(begin: 1.0, end: 0.0)
        : Tween(begin: 0.0, end: 1.0);
  }
}
