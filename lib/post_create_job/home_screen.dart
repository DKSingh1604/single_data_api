// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/post_create_job/api_services.dart';
import 'package:single_data_api/post_create_job/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  //model
  CreateJobModel createJobModel = CreateJobModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: TextField(
              controller: jobController,
              decoration: InputDecoration(
                label: Text("Job"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                ApiServices()
                    .createJob(
                  nameController.text.toString(),
                  jobController.text.toString(),
                )
                    .then((value) {
                  setState(() {
                    createJobModel = value!;
                    print(createJobModel.id);
                    print(createJobModel.name);
                    print(createJobModel.job);
                  });
                });
              },
              child: Text("Get Data"),
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: [
              createJobModel.id == null
                  ? Text("No id")
                  : Text("Id: ${createJobModel.id}"),
              createJobModel.name == null
                  ? Text("No name")
                  : Text("Id: ${createJobModel.name}"),
              createJobModel.job == null
                  ? Text("No job")
                  : Text("Id: ${createJobModel.job}"),
            ],
          ),
        ],
      ),
    );
  }
}
