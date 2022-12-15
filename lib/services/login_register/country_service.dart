import 'package:b2geta_mobile/models/login_register/country_model.dart';
import 'package:flutter/material.dart';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/login_register/language_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryService {
  List<String> countries = [];

  Future<List<CountryModel>> getCountryList() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/countries'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");
      var status = json.decode(response.body)["status"];

      if (status == true) {
        final list = json.decode(response.body)["data"] as List<dynamic>;
        return list.map((e) => CountryModel.fromJson(e)).toList();
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
    }
  }
}
