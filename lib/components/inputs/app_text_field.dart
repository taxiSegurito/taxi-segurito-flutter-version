import 'package:flutter/material.dart';

class AppTextField extends TextFormField {
  AppTextField({
    String? label,
    String? hint,
    TextEditingController? controller,
    bool obscureText = false,
    dynamic validator,
  }) : super(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
            hintText: hint,
          ),
          controller: controller,
          validator: validator,
          obscureText: obscureText,
        );
}
