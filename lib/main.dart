// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/mixed/screen_with_model.dart';
import 'package:single_data_api/mixed/screen_without_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenWithoutModel(),
    );
  }
}
