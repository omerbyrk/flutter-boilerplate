import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final ThemeData themeData = new ThemeData(
    textTheme: GoogleFonts.loraTextTheme(),
    brightness: Brightness.light,
    primarySwatch: AppColors.red,
    primaryColor: AppColors.red,
    primaryColorBrightness: Brightness.light,
    accentColor: AppColors.sky,
    accentColorBrightness: Brightness.light);
