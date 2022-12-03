import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    required this.hintText,
    required this.validator,
    this.obscureText = false,
    required this.icon,
    required this.focusedColor,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? textInputType;
  final Icon icon;
  final Color focusedColor;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: icon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: hintText,
      ),
    );
  }
}
