import 'package:flutmovie/core/consts/app_consts.dart';
import 'package:flutmovie/core/consts/enums.dart';
import 'package:flutmovie/core/theme/app_colors.dart';
import 'package:flutmovie/core/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRichText extends StatelessWidget {
  final String text;
  final int maxLines;
  final SizeType fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  final Color color;

  const AppRichText(
      {Key key,
      @required this.text,
      this.maxLines = AppConsts.int_infinity,
      this.fontSize = SizeType.xxSmall,
      this.color = AppColors.black,
      this.align = TextAlign.start,
      this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: this.align,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: text,
        style: GoogleFonts.lora(
            fontWeight: fontWeight,
            fontSize: this.getFontSize(fontSize),
            color: color),
      ),
    );
  }
}
