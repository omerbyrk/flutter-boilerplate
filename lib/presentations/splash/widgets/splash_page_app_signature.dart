import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/consts/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';

class SplashPageSignature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.7,
        child: Text(
          t("sp_signature"),
          style: GoogleFonts.bitter(
              fontSize: this.getFontSize(SizeType.xxLarge),
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
