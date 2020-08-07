import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFfee7e8),
      100: Color(0xFFfcb6b9),
      200: Color(0xFFfa858a),
      300: Color(0xFFf8545c),
      400: Color(0xFFf6232d),
      500: Color(_redPrimaryValue),
      600: Color(0xFFc40812),
      700: Color(0xFFab070f),
      800: Color(0xFF93060d),
      900: Color(0xFF7a050b),
    },
  );
  static const int _redPrimaryValue = 0xFFe50914;

  static const MaterialColor sky = MaterialColor(
    _skyPrimaryValue,
    <int, Color>{
      300: Color(0xFFedf4f8),
      400: Color(0xFFdaeaf1),
      500: Color(_skyPrimaryValue),
      600: Color(0xFFc8dfea),
      700: Color(0xFFb6d5e2),
      800: Color(0xFFa3cadb),
      900: Color(0xFF91c0d4),
    },
  );
  static const int _skyPrimaryValue = 0xFFd8e9f0;

  static const Color black = const Color(0xFF29252c);

  static const Color white = Colors.white;

  static const Color navyBlue = const Color(0xFF33425b);
}
