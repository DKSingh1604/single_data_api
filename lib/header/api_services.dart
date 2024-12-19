import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> getUserDetails() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTczNDU4OTYzNywiZXhwIjoxNzM2MzE3NjM3fQ.pQEZLVBvxdBc4arce62nGSPH0YjR_A5gp2ibG-WTaIc";
    var response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/auth/profile"),
        headers: {"Authorization": "Bearer "});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
