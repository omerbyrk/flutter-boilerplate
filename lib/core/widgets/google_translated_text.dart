import 'package:flutmovie/core/consts/app_consts.dart';
import 'package:flutmovie/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../consts/enums.dart';
import 'index.dart';

class GtText extends StatelessWidget {
  final String text;
  final TextAlign align;
  final FontWeight fontWeight;
  final Color color;
  final int maxLines;
  final SizeType sizeType;

  const GtText(
      {Key key,
      this.text,
      this.align = TextAlign.start,
      this.color = AppColors.black,
      this.sizeType = SizeType.Middle,
      this.maxLines = AppConsts.int_infinity,
      this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: this.tg(text),
        initialData: text,
        builder: (_, snapshot) {
          return AppRichText(
            text: snapshot.data,
            maxLines: maxLines,
            align: align,
            color: color,
            fontSize: sizeType,
            fontWeight: fontWeight,
          );
        });
  }
}
