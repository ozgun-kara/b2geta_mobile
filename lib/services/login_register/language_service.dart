import 'package:b2geta_mobile/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  Future<bool> getLanguages() async {
    final response = await http.get(
      Uri.parse(Constants.apiUrl + 'languages'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      // encoding: Encoding.getByName('utf-8'),
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: " + response.statusCode.toString());
      debugPrint("RESPONSE DATA: " + response.body.toString());

      // var result = LoginModel.fromJson(response.body);

      var status = json.decode(response.body)["status"];

      if (status == true) {
        // var token = json.decode(response.body)["access_token"];
        // debugPrint("TOKEN: " + token.toString());

        return true;
      } else {
        return false;
      }
    } else {
      debugPrint("DATA ERROR\nSTATUS CODE: " + response.statusCode.toString());

      // throw ("Bir sorun oluştu ${response.statusCode}");

      return false;
    }
  }

  void func() async {
    var url = Uri.https(Constants.apiUrl, '/languages', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
