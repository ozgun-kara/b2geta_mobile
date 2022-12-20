import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<bool> loginCall(
      {required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/member/login'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

      // var result = LoginModel.fromJson(response.body);

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var token = json.decode(response.body)["access_token"];
        debugPrint("TOKEN: " + token.toString());
        Constants.userToken = token;
        saveToken(token);
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return false;
    }
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Token', token);
    debugPrint("TOKEN HAS SAVED");
    readToken();
  }

  Future<String?> readToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('Token');
    debugPrint("TOKEN HAS FETCHED: " + token.toString());
    return token;
  }
}
