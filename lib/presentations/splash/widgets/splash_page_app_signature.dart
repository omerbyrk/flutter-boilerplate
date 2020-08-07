import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';

class SplashPageSignature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.7,
        child: Text(
          "Movie APP Example",
          style: GoogleFonts.bitter(
              fontSize: 25,
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
