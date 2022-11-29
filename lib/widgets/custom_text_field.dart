import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.obscureText,
    required this.icon,
    required this.focusedColor,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final Icon icon;
  final Color focusedColor;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
