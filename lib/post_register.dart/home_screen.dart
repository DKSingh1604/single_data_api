// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/post_register.dart/api_services.dart';
import 'package:single_data_api/post_register.dart/model.dart';

class HomeScreen extends StatefulWidget {
  final String? id;
  final String? token;
  const HomeScreen({
    super.key,
    this.id,
    this.token,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //model
  RegisterModel registerModel = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email"),
                hintText: "Your email",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                label: Text("Password"),
                hintText: "Your Password",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ApiServices()
                      .register(emailController.text.toString(),
                          passwordController.text.toString())
                      .then((value) {
                    setState(() {
                      registerModel = value!;
                    });
                  }).onError((error, stackTrace) {
                    print(error);
                  });
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Column(
              children: [
                Text("Id: ${registerModel.id.toString()}"),
                Text("Token: ${registerModel.token.toString()}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
