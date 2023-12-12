// ignore_for_file: avoid_print, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:appioc/page/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appioc/firebase_options.dart';
import 'package:appioc/page/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      home: LoginPage(),
    );
  }
}
