// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/header/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic userDetails;
  bool isLoading = false;
  getUserDetails() {
    setState(() {
      isLoading = true;
    });
    ApiServices().getUserDetails().then((value) {
      print('user details ==> ${value.toString()}');
      setState(() {
        userDetails = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Http Api Header",
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Center(),
    );
  }
}
