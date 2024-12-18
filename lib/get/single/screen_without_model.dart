// FOR SINGLE DATA WITHOUT MODEL

import 'package:flutter/material.dart';
import 'package:single_data_api/get/single/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic singlePost;
  bool isReady = false;
  _getSinglePostWithoutModel() {
    isReady = true;
    SingleApiServices().getSinglePostWithoutModel().then((value) {
      setState(() {
        singlePost = value;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
      isReady = false;
    });
  }

  @override
  void initState() {
    _getSinglePostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Without Model"),
        ),
        body: isReady == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(singlePost['userId'].toString()),
                    Text(
                      singlePost['title'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(singlePost['body'].toString()),
                  ],
                ),
              ));
  }
}
