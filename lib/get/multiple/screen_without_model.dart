import 'package:flutter/material.dart';
import 'package:single_data_api/get/multiple/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  bool isReady = false;
  dynamic postList = [];
  _getPost() {
    isReady = true;
    ListApiServices().getPostWithoutModel().then((value) {
      setState(() {
        postList = value;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
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
        title: Text("Multiple Post without Model"),
        centerTitle: true,
      ),
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      postList[index]["id"].toString(),
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    title: Text(postList[index]["title"].toString()),
                    subtitle: Text(
                      postList[index]["body"].toString(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
