// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_data_api/20December2024/get_api/models/employee.dart';
import 'package:single_data_api/20December2024/get_api/services/employee_services.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Data"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              focusColor: Colors.red,
              onPressed: () {
                print(EmployeeServices().getAllEmployeeData());
              },
              icon: Icon(
                Icons.refresh,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: EmployeeServices().getAllEmployeeData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error fetching employee data: $ErrorDescription"),
              );
            }
            if (snapshot.hasData) {
              var data = snapshot.data as List<Employee>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index].avatar!),
                    ),
                    title: Text(
                      "${data[index].firstName} ${data[index].lastName}",
                    ),
                    subtitle: Text(data[index].email!),
                    trailing: Text(data[index].id.toString()),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
