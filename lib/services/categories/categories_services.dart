import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/categories/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  // CATEGORIES
  Future<List<CategoryModel>> categoriesCall(
      {required Map<String, String> queryParameters,
      required String language}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/categories')
          .replace(queryParameters: queryParameters),
      headers: {
        "Accept-Language": language,
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<CategoryModel> categoryList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");
      // debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];
      var dataList = json.decode(response.body)["data"];
      if (status == true) {
        for (var address in dataList) {
          categoryList.add(CategoryModel.fromJson(address));
        }

        return categoryList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return categoryList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return categoryList;
    }
  }

  // CATEGORIES NESTED
  Future<bool> categoriesNestedCall({required String language}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/categories/nested'),
      headers: {
        "Accept-Language": language,
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

  // CATEGORY FEATURES
  Future<bool> categoryFeaturesCall(
      {required Map<String, String> queryParameters}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/category_features')
          .replace(queryParameters: queryParameters),
      headers: {},
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
