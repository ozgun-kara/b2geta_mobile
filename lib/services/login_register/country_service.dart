import 'package:b2geta_mobile/models/login_register/country_model.dart';
import 'package:flutter/material.dart';
import 'package:b2geta_mobile/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryService {
  Future<List<CountryModel>> getCountryList() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/countries'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    List<CountryModel> countries = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");
      var status = json.decode(response.body)["status"];

      if (status == true) {
        // final list = json.decode(response.body)["data"] as List<dynamic>;
        // return list.map((e) => CountryModel.fromJson(e)).toList();

        var list = json.decode(response.body)["data"];
        for (var element in list) {
          // countries.add(element["name"]);
          countries.add(CountryModel.fromJson(element));
        }
        return countries;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return countries;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return countries;
    }
  }
}
