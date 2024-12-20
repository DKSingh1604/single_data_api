import 'dart:convert';

import 'package:single_data_api/post/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //WITH MODEL
  Future<LoginModel?> loginWithModel(String email, String password) async {
    try {
      var url = Uri.parse("https://reqres.in/api/login");
      var response =
          await http.post(url, body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //WITHOUT MODEL
  Future<dynamic> loginWithoutModel(String email, String password) async {
    try {
      var url = Uri.parse("https://reqres.in/api/login");
      var response =
          await http.post(url, body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
