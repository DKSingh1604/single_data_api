// ignore_for_file: prefer_interpolation_to_compose_strings

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
          .timeout(const Duration(seconds: 10), onTimeout: () {
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

  updateCompanyPartially(Map<String, dynamic> updatedData, int id) async {
    try {
      var response = await http.patch(Uri.parse(baseUrl + "company/$id"),
          body: updatedData);

      print("The response status is ${response.statusCode}");

      if (response.statusCode == 204 ||
          response.statusCode == 201 ||
          response.statusCode == 200) {
        print("Company with id:$id successfully updated");
      } else if (response.statusCode == 404) {
        print("Company not found or already updated.");
      } else {
        throw Exception(
            "Error occured with status code: ${response.statusCode} and the message is ${response.body}");
      }
    } catch (e) {
      print("Error occured is: ${e.toString()}");
    }
  }

  updateCompany(Company company, int id) async {
    try {
      var response = await http.put(Uri.parse(baseUrl + "company/$id"),
          body: company.toJson());

      print("The response status is ${response.statusCode}");

      if (response.statusCode == 204 ||
          response.statusCode == 201 ||
          response.statusCode == 200) {
        print("Company with id:$id successfully updated");
      } else if (response.statusCode == 404) {
        print("Company not found or already updated.");
      } else {
        throw Exception(
            "Error occured with status code: ${response.statusCode} and the message is ${response.body}");
      }
    } catch (e) {
      print("Error occured is: ${e.toString()}");
    }
  }

  deleteCompany(int id) async {
    try {
      var response = await http.delete(Uri.parse(baseUrl + "company/$id"));

      if (response.statusCode == 204 || response.statusCode == 201) {
        print("Company with id:$id successfully deleted");
      } else if (response.statusCode == 404) {
        print("Company not found or already deleted.");
      } else {
        throw Exception(
            "Error occured with status code: ${response.statusCode} and the message is ${response.body}");
      }
    } catch (e) {
      print("Error occured is: ${e.toString()}");
    }
  }
}
