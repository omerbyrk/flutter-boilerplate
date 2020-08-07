import 'package:covid19_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
          fontSize: 18,
        ),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          prefix: SizedBox(
            width: 10,
          ),
          suffixIcon: this.icon != null
              ? InkWell(
                  onTap: this.onIconClick,
                  child: Icon(
                    this.icon,
                    size: 25.0,
                    color: AppColors.red,
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
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
            color: Colors.grey[400], width: 1.0, style: BorderStyle.solid));
  }
}
