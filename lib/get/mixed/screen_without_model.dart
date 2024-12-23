import 'package:flutter/material.dart';
import 'package:single_data_api/get/mixed/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  bool isReady = false;
  dynamic multiData;
  _getMultiData() {
    isReady = true;
    ApiServices().getMultiDataWithoutModel().then((value) {
      setState(() {
        multiData = value;
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
      appBar: AppBar(
        title: const Text("Mixed Data Without Model"),
        centerTitle: true,
      ),
      body: isReady == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text(
                  "Page - ${multiData["page"]}",
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
                Text(
                  "Total - ${multiData["total"]}",
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
                Text(
                  "Total Pages - ${multiData["total_pages"]}",
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: multiData["data"].length - 3,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(
                            multiData["data"][index]["id"].toString(),
                            style: const TextStyle(
                                backgroundColor: Colors.amberAccent),
                          ),
                          title: Text(
                            multiData["data"][index]["name"],
                          ),
                          subtitle: Text(
                            multiData["data"][index]["year"].toString(),
                          ),
                          trailing: Text(
                            multiData["data"][index]["pantone_value"],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
