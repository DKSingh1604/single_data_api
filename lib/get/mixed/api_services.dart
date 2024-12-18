import 'dart:convert';

import 'package:single_data_api/mixed/multi_data_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //with model
  Future<MultiData?> getMultiDataWithModel() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if (response.statusCode == 200) {
        MultiData model = MultiData.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //without model
  Future<dynamic> getMultiDataWithoutModel() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
