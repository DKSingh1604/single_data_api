import 'dart:convert';

import 'package:single_data_api/post_create_job/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<CreateJobModel?> createJob(String name, String job) async {
    try {
      var url = Uri.parse("https://reqres.in/api/users");

      var response = await http.post(url, body: {
        "name": name,
        "job": job,
      });

      if (response.statusCode == 201) {
        CreateJobModel model =
            CreateJobModel.fromJson(jsonDecode(response.body));

        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
