// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/header/home_screen.dart';
// import 'package:single_data_api/get/mixed/screen_without_model.dart';
import 'package:single_data_api/post/login_screen.dart';
// import 'package:single_data_api/post_register.dart/home_screen.dart';
import 'package:single_data_api/post_register.dart/model.dart';
// import 'package:single_data_api/post_create_job/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
