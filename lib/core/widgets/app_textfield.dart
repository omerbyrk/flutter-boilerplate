import 'package:flutter/material.dart';

import '../consts/enums.dart';
import '../theme/app_colors.dart';
import 'index.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String Function(String) validator;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final void Function() onIconClick;
  final bool obscureText;
  final ShapeBorder shape;
  final IconData icon;

  const AppTextField(
      {Key key,
      this.hintText,
      this.controller,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.onIconClick,
      this.obscureText = false,
      this.shape,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: _shape,
      child: TextFormField(
        controller: this.controller,
        validator: this.validator,
        onChanged: this.onChanged,
        onSaved: this.onSaved,
        obscureText: this.obscureText,
        style: TextStyle(
          fontSize: this.getFontSize(SizeType.Middle),
        ),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          prefix: SizedBox(
            width: this.convertSize(12.0),
          ),
          suffixIcon: this.icon != null
              ? InkWell(
                  onTap: this.onIconClick,
                  child: Container(
                    padding: EdgeInsets.only(right: convertSize(8)),
                    child: Icon(
                      this.icon,
                      size: this.getIconSize(SizeType.Middle),
                      color: AppColors.red,
                    ),
                  ),
                )
              : null,
          border: InputBorder.none,
          hintText: this.hintText,
        ),
      ),
    );
  }

  ShapeBorder get _shape {
    if (this.shape != null) return this.shape;

    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.convertSize(12.0)),
        side: BorderSide(
            color: AppColors.grey[400],
            width: this.convertSize(1.2),
            style: BorderStyle.solid));
  }
}
