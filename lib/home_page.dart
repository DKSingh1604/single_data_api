import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = "";
  //GET
  Future<void> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Data fetched successfully : ${response.body}");
      setState(() {
        _data = response.body;
      });
    } else {
      print("Fetching failed");
      setState(() {
        _data = "Failed to load data";
      });
    }
  }

  //CREATE
  Future<void> createData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.post(url, body: {
      'title': 'New Post',
      'body': 'Here is the body',
      'userId': '1',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Data created successfully : ${response.body}");
      setState(() {
        _data = response.body;
      });
    } else {
      setState(() {
        _data = "Failed to create data";
      });
    }
  }

  //DELETE DATA
  Future<void> deleteData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.delete(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Data deleted successfully : ${response.body}");
      setState(() {
        _data = response.body;
      });
    } else {
      setState(() {
        _data = "Failed to delete data";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("HTTP request in flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: fetchData, child: const Text("Fetch Data")),
                ElevatedButton(
                    onPressed: createData, child: const Text("Create Data")),
                ElevatedButton(
                    onPressed: deleteData, child: const Text("Delete Data")),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_data),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
