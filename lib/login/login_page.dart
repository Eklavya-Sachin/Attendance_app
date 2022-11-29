import 'package:attendance_app/widgets/custom_text_field.dart';
import 'package:attendance_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/signin.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Hello There',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sign In to your Account',
                        style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        focusedColor: Colors.pink.shade200,
                        icon: Icon(Icons.email, color: Colors.pink[200]),
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
                            return 'Enter a Your email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        focusedColor: Colors.pink.shade200,
                        icon: Icon(Icons.password, color: Colors.pink[200]),
                        obscureText: true,
                        controller: _passwordController,
                        hintText: 'Password',
                        validator: (value) {
                          if (value != null && value.length < 7) {
                            return 'This Field is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forget your Password?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                  color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GradientButton(
                        color1: const Color.fromARGB(255, 221, 204, 27),
                        color2: const Color.fromARGB(255, 222, 108, 210),
                        buttonText: 'Sign In',
                        onPressed: (){},
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[600]),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "Create",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
