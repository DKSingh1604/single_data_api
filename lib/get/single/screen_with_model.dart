//SINGLE DATA WITH MODEL

import 'package:flutter/material.dart';
import 'package:single_data_api/get/single/api_services.dart';
import 'package:single_data_api/get/single/single_post_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isReady = false;
  SinglePostWithModel singlePostWithModel = SinglePostWithModel();

  _getSinglePost() {
    isReady = true;
    SingleApiServices().getSinglePostWithModel().then((value) {
      setState(() {
        singlePostWithModel = value!;
        isReady = false;
      });
    }).onError((error, StackTrace) {
      print(error);
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Single"),
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
                  Text(
                    singlePostWithModel.userId.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Text(
                    singlePostWithModel.title.toString(),
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 233, 33, 243)),
                  ),
                  Text(
                    singlePostWithModel.body.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
