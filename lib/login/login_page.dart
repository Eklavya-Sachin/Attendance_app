import 'dart:ffi';

import 'package:attendance_app/widgets/custom_text_field.dart';
import 'package:attendance_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
   

  Future<void> logIn(){
  return logIn();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Hello There',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _userIdController,
                    keyboardType: TextInputType.name,
                    hintText: 'User ID',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.name,
                    hintText: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    buttonText: 'Log In',
                    onPressed: logIn,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
