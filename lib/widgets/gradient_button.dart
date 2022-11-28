import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
            gradient: LinearGradient(
              colors: <Color>[Colors.blue, Colors.pink],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
