import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApicallLogin {
  Future<bool> login(String email, String password) async {
    SharedPreferences token = await SharedPreferences.getInstance();
    var url = Uri.parse('https://reqres.in/api/login');

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final reposndeToken = responseData['token'];
      if (reposndeToken == null) {
        token.setBool('Token', false);
      } else {
        token.setBool('Token', true);
      }

      return true;
    } else {
      return false;
    }
  }
}
