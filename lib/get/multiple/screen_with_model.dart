//LIST OR MULTIPLE API

import 'package:flutter/material.dart';
import 'package:single_data_api/get/multiple/api_services.dart';
import 'package:single_data_api/get/multiple/post_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isReady = false;
  List<PostModel> postModel = [];
  _getPost() {
    isReady = true;
    ListApiServices().getPostWithModel().then((value) {
      setState(() {
        postModel = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post with Model"),
      ),
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
              itemCount: postModel.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      postModel[index].id.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    title: Text(
                      postModel[index].title.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(postModel[index].body.toString()),
                  ),
                );
              },
            ),
    );
  }
}
