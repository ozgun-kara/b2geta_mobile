import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/login_register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future<bool> registerCall({
    required String email,
    required String password,
    required String companyName,
    String? officialPerson,
    String? officialPhone,
    String? country,
  }) async {
    final response = await http.put(
      Uri.parse('${Constants.apiUrl}/member'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      // encoding: Encoding.getByName('utf-8'),
      body: {
        "username": email,
        "password": password,
        "company_name": companyName,
        "firstname": officialPerson,
        "phone_number": officialPhone,
        "country": country
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: " + response.statusCode.toString());
      debugPrint("RESPONSE DATA: " + response.body.toString());

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var data = json.decode(response.body)["data"];

        var result = RegisterModel.fromJson(data);

        debugPrint("userId: " + result.userId.toString());
        debugPrint("verifyCode: " + result.verifyCode.toString());

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
}
