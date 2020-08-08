import 'package:covid19_app/core/consts/enums.dart';
import 'package:covid19_app/core/widgets/index.dart';
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
          t("sp_signature"),
          style: GoogleFonts.bitter(
              fontSize: this.getFontSize(SizeType.Middle),
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
