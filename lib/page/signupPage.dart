// ignore_for_file: avoid_print, unused_import, file_names, unused_local_variable, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appioc/help/help.dart';
import 'package:appioc/page/loginPage.dart';
import 'package:page_transition/page_transition.dart';

import '../db/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: const Color.fromARGB(214, 255, 214, 64),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/OnePiece.jpg'), // Đường dẫn tới ảnh
            fit: BoxFit.cover, // Để ảnh đảm bảo đầy đủ không gian của Container
          ),
        ),

        padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 40),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 216, 205, 216).withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.0), // Đặt bán kính bo góc
          ),
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 330,
                  height: 60,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 91, 94, 93).withOpacity(0.9),
                    borderRadius:
                        BorderRadius.circular(50.0), // Đặt bán kính bo góc
                  ),
                  child: const Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          inherit: true),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_outlined),
                    labelText: 'Gmail',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    // Màu sắc của nhãn
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0))),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0,
                              0)), // Màu sắc và độ đậm của viền khi có focus
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key_rounded),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    // Màu sắc của nhãn
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0))),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0,
                              0)), // Màu sắc và độ đậm của viền khi có focus
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 174, 255)
                        .withOpacity(0.9), // Đặt màu nền của nút
                  ),
                  onPressed: () async {
                    // Xử lý đăng nhập ở đây
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print(email);
                    // Thực hiện xác thực, chuyển đến màn hình chính, v.v.
                    User? user = await login()
                        .signUpWithEmailAndPassword(context, email, password);
                    if (user != null) {
                      print('đã đăng ký với :${user}');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                      showSnackbar('Vui lòng đăng nhập lại');
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Text('You Have Account?'),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 0, 0)
                          .withOpacity(0.9), // Đặt màu nền của nút
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
