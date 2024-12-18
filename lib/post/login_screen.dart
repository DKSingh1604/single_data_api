// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/post/api_services.dart';
import 'package:single_data_api/post/home_screen.dart';

import 'package:single_data_api/post/model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //login method
  LoginModel loginModel = LoginModel();
  bool isReady = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("Post Login Screen"),
        leadingWidth: 170,
        title: loginModel.token == null || loginModel.token == ""
            ? Text("no token")
            : Text("${loginModel.token}"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email"),
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                label: Text("Password"),
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isReady = true;
                });
                //WITH MODEL FUNCTIONALITY
                ApiServices()
                    .loginWithModel(emailController.text.toString(),
                        passwordController.text.toString())
                    .then((value) {
                  setState(() {
                    isReady = false;
                    loginModel = value!;
                    //PRINT THE TOKEN
                    print(loginModel.token);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(token: loginModel.token.toString()),
                      ),
                    );
                  });
                }).onError((error, StackTrace) {
                  isReady = false;
                  print(error);
                });

                //WITHOUT MODEL FUNCTIONALITY
                // ApiServices()
                //     .loginWithoutModel(emailController.text.toString(),
                //         passwordController.text.toString())
                //     .then((value) {
                //   setState(() {
                //     isReady = false;
                //     //PRINT THE TOKEN
                //     print(value["token"]);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) =>
                //             HomeScreen(token: value["token"].toString()),
                //       ),
                //     );
                //   });
                // }).onError((error, StackTrace) {
                //   isReady = false;
                //   print(error);
                // });
              },
              child: isReady == true
                  ? Center(child: CircularProgressIndicator())
                  : Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
