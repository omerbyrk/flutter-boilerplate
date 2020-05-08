import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String Function(String) validator;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final bool obscureText;
  final ShapeBorder shape;

  const AppTextField(
      {Key key,
      this.hintText,
      this.controller,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.obscureText = false,
      this.shape})
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
        cursorColor: Colors.purple[800],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          isDense: false,
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
