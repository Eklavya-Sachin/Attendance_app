import 'package:attendance_app/auth/auth_controller.dart';
import 'package:attendance_app/widgets/custom_text_field.dart';
import 'package:attendance_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/signup.png"),
                        fit: BoxFit.fitWidth),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Column(
                      children: [
                        const Text(
                          'Hello There',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Create Your Account Here',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CustomTextField(
                        focusedColor: Colors.black,
                        icon: const Icon(Icons.email, color: Colors.black),
                        obscureText: false,
                        controller: _emailController,
                        hintText: 'Email ID',
                        validator: (value) {
                          const pattern =
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?)*$";
                          final regexp = RegExp(pattern);
                          if (value == null ||
                              value.isEmpty ||
                              !regexp.hasMatch(value)) {
                            return 'Enter a valid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        focusedColor: Colors.black,
                        icon: const Icon(Icons.lock, color: Colors.black),
                        obscureText: true,
                        controller: _passwordController,
                        hintText: 'Password',
                        validator: (value) {
                          if (value!.length < 7) {
                            return 'password must be 7 character long';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GradientButton(
                        color1: const Color.fromARGB(255, 91, 95, 99),
                        color2: const Color.fromARGB(255, 31, 31, 30),
                        buttonText: "Sign Up",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthController.instance.register(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Aready have an account!',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[600]),
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Text(
                              " Sign In",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 52, 52, 53),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
