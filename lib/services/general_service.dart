import 'dart:convert';
import 'package:b2geta_mobile/models/general_models/city_model.dart';
import 'package:b2geta_mobile/models/general_models/country_model.dart';
import 'package:b2geta_mobile/models/general_models/district_model.dart';
import 'package:b2geta_mobile/models/general_models/language_model.dart';
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeneralService {
  // INDEX
  Future<bool> indexCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/index'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      // debugPrint("RESPONSE DATA: ${response.body}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return false;
    }
  }

  // LANGUAGES
  Future<bool> languagesCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/languages'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      // debugPrint("RESPONSE DATA: ${response.body}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return false;
    }
  }

  Future<List<LanguageModel>> getLanguageCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/languages'),
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
        return list.map((e) => LanguageModel.fromJson(e)).toList();
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
    }
  }

  // COUNTRIES
  Future<List<CountryModel>> countriesCall() async {
    final response = await http.get(Uri.parse('${Constants.apiUrl}/countries'));
    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<CountryModel> countryList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");

      var status = responseBody["status"];

      if (status == true) {
        var data = responseBody["data"];
        for (var element in data) {
          countryList.add(CountryModel.fromJson(element));
        }
        return countryList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return countryList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return countryList;
    }
  }

  // BRANDS
  Future<bool> brandsCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/brands'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      // debugPrint("RESPONSE DATA: ${response.body}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return false;
    }
  }

  // CITIES
  Future<List<CityModel>> citiesCall({
    required String country,
  }) async {
    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/cities').replace(queryParameters: {
          'country': country,
        }),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        });
    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<CityModel> cityList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");

      var status = responseBody["status"];

      if (status == true) {
        var data = responseBody["data"];
        for (var element in data) {
          cityList.add(CityModel.fromJson(element));
        }
        return cityList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return cityList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return cityList;
    }
  }

  // TOWN LIST
  Future<List<DistrictModel>> townListCall({
    required String city,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/town').replace(queryParameters: {
        'city': city,
      }),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      }
    );
    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<DistrictModel> districtList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");

      var status = responseBody["status"];

      if (status == true) {
        var data = responseBody["data"];
        for (var element in data) {
          districtList.add(DistrictModel.fromJson(element));
        }
        return districtList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return districtList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return districtList;
    }
  }
}
