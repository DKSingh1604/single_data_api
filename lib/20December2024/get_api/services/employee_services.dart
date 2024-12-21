import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:single_data_api/20December2024/get_api/models/employee.dart';

class EmployeeServices {
  String baseUrl = "https://reqres.in/api/";

  // GET METHOD
  getAllEmployeeData() async {
    List<Employee> allEmployees = [];
    try {
      var response = await http.get(Uri.parse("${baseUrl}users?page=2"));

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        var employees = decodedData['data'];

        // print(employees);

        for (var employee in employees) {
          Employee newEmployee = Employee.fromJson(employee);
          allEmployees.add(newEmployee);
        }

        print(allEmployees);

        return allEmployees;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
