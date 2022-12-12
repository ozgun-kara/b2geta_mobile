import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/languages_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  Future<LanguagesModel> getLanguages() async {
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

      var status = json.decode(response.body)["status"];

      if (status == true) {
        // var token = json.decode(response.body)["access_token"];
        // debugPrint("TOKEN: " + token.toString());

        var result = LanguagesModel.fromJson(response.body);

        return result;
      } else {
        throw ("Bir sorun oluştu ${response.statusCode}");
      }
    } else {
      debugPrint("DATA ERROR\nSTATUS CODE: " + response.statusCode.toString());

      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  Future<List> getLanguagesList() async {
    final response = await http.get(
      Uri.parse(Constants.apiUrl + 'languages'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        var result = LanguagesModel.fromJson(response.body);

        final list = result.data as List<dynamic>;

        return list;
      } else {
        debugPrint(
            "DATA ERROR\nSTATUS CODE: " + response.statusCode.toString());
        throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: " + response.statusCode.toString());
      throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
    }
  }

  // void func() async {
  //   var url = Uri.https(Constants.apiUrl, '/languages', {'q': '{http}'});
  //
  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonResponse =
  //         convert.jsonDecode(response.body) as Map<String, dynamic>;
  //     var itemCount = jsonResponse['totalItems'];
  //     print('Number of books about http: $itemCount.');
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }
}
