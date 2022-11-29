import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final String buttonText;
  final Color color1;
  final Color color2;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
          gradient: LinearGradient(
            colors: <Color>[color1, color2],
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
