import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:single_data_api/21December2024/models/company.dart';

class CompanyServices {
  String baseUrl = "https://retoolapi.dev/phJf3f/";

  getAllCompanies() async {
    try {
      List<Company> allCompanies = [];

      var response = await http
          .get(Uri.parse("${baseUrl}company"))
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw Exception("Request Timed Out");
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.body;
        var jsonData = jsonDecode(data);

        print(jsonData);

        for (var company in jsonData) {
          Company newCompany = Company.fromJson(company);
          allCompanies.add(newCompany);
        }

        return allCompanies;
      } else {
        throw Exception(
            "Error occured with status code: ${response.statusCode} and the message is ${response.body}");
      }
    } catch (e) {
      print("Error occured is: ${e.toString()}");
      rethrow;
    }
  }

  createCompany(Company company) async {
    print("Create company is called");
    try {
      var response = await http.post(Uri.parse("${baseUrl}company"),
          body: company.toJson());

      print("The response is ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(
            "Company is successfully created with the following details :- ${response.body}");
      } else {
        throw Exception(
            "Error occured with status code: ${response.statusCode} and the message is ${response.body}");
      }
    } catch (e) {
      print("Error occured is: ${e.toString()}");
    }
  }

  updateCompany() async {
    try {} catch (e) {
      print("Error occured is: ${e.toString()}");
    }
  }

  deleteCompany() async {
    try {} catch (e) {
      print("Error occured is: ${e.toString()}");
    }
  }
}
