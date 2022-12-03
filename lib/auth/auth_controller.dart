import 'package:attendance_app/pages/home_screen.dart';
import 'package:attendance_app/pages/login/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialPage);
  }

  _initialPage(User? user) {
    if (user == null) {
      debugPrint('Login page');
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUserDetial(password, email);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Account Creation Failed',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  Future addUserDetial(String password, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'password': password,
    });
  }
}
