// ignore_for_file: avoid_print, file_names, unused_local_variable, duplicate_ignore, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appioc/page/home.dart';
import 'package:appioc/page/signupPage.dart';

import '../db/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      // appBar: AppBar(
      //   title: const Text(
      //     'Lookgin Page',
      //     style: TextStyle(color: Colors.pink),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.orangeAccent,
      // ),
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
                      "Login",
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
                    hintText: 'Gmail',
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
                    backgroundColor: const Color.fromARGB(255, 255, 0, 0)
                        .withOpacity(0.9), // Đặt màu nền của nút
                  ),
                  onPressed: () async {
                    // Xử lý đăng nhập ở đây
                    // ignore: unused_local_variable
                    String email = _emailController.text;
                    // ignore: unused_local_variable
                    String password = _passwordController.text;
                    // Thực hiện xác thực, chuyển đến màn hình chính, v.v.
                    User? user = await login()
                        .signInWithEmailAndPassword(context, email, password);
                    if (user != null) {
                      print('Đã đăng nhập với :${user}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(data: user.uid),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    User? user = await login().loginWithGmailAccount();
                    if (user != null) {
                      print('Đăng nhập mail thành công');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(data: user.uid),
                        ),
                      );
                    }
                  },
                  child: Image.asset('assets/googlemail.png',
                      width: 30, height: 30),
                ),
                const Text('You Don`t Have Account?'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Register',
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