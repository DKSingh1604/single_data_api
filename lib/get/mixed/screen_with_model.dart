// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/get/mixed/api_services.dart';
import 'package:single_data_api/get/mixed/multi_data_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  MultiData multiData = MultiData();

  bool isReady = false;
  _getMultiData() {
    isReady = true;
    ApiServices().getMultiDataWithModel().then((value) {
      setState(() {
        multiData = value!;
        isReady = false;
      });
    }).onError((error, StackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    _getMultiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 245, 3),
      appBar: AppBar(
        title: Text("Mulit Data with  model"),
        centerTitle: true,
      ),
      body: isReady == true
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(
                  multiData.page.toString(),
                  style: TextStyle(color: Colors.deepOrange, fontSize: 30),
                ),
                Text(
                  multiData.total.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Text(
                  multiData.totalPages.toString(),
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    multiData.support?.text.toString() ?? '',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: multiData.data!.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          leading: Text(multiData.data![i].id.toString()),
                          title: Text(multiData.data![i].name.toString()),
                          subtitle: Text(multiData.data![i].year.toString()),
                          trailing:
                              Text(multiData.data![i].pantoneValue.toString()),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
