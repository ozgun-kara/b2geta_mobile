import 'dart:convert';
import 'package:b2geta_mobile/models/dummy/language_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy/product_dummy_model.dart';
import 'package:b2geta_mobile/models/login_register/country_model.dart';
import 'package:b2geta_mobile/models/login_register/language_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeneralService {
  // DUMMY
  Future<List<LanguageDummyModel>> getLanguageList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/language_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => LanguageDummyModel.fromJson(e)).toList();
  }

  Future<List<ProductDummyModel>> getProductList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/product_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDummyModel.fromJson(e)).toList();
  }

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
  Future<bool> countriesCallTest() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/countries'),
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

  Future<List<CountryModel>> countriesCall() async {
    final response = await http.get(Uri.parse('${Constants.apiUrl}/countries'));
    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<CountryModel> countries = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: $responseBody");

      var status = responseBody["status"];

      if (status == true) {
        var data = responseBody["data"];
        for (var element in data) {
          countries.add(CountryModel.fromJson(element));
        }
        return countries;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return countries;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return countries;
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
  Future<bool> citiesCall({
    required String country,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/cities').replace(queryParameters: {
        'country': country,
      }),
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

  // TOWN LIST
  Future<bool> townListCall({
    required String city,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/town').replace(queryParameters: {
        'city': city,
      }),
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
}
