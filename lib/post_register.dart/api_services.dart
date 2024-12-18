import 'dart:convert';

import 'package:single_data_api/post_register.dart/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<RegisterModel?> register(String email, String password) async {
    try {
      var url = Uri.parse("https://reqres.in/api/register");

      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
}
