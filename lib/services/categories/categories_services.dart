import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/categories/category_featureas_model.dart';
import 'package:b2geta_mobile/models/categories/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  // CATEGORIES
  Future<List<CategoryModel>> categoriesCall(
      {Map<String, String>? queryParameters}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/categories')
          .replace(queryParameters: queryParameters),
      headers: {
        "Accept-Language": Constants.language!,
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

  // SUB CATEGORIES
  Future<List<CategoryModel>> subCategoriesCall(
      {required String parentId}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/categories?parent_id=$parentId'),
      headers: Constants.headers,
    );

    List<CategoryModel> subCategoryList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      // debugPrint("RESPONSE DATA: ${response.body}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];
      var dataList = json.decode(response.body)["data"];

      if (status == true) {
        for (var subCategory in dataList) {
          subCategoryList.add(CategoryModel.fromJson(subCategory));
        }
        return subCategoryList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return subCategoryList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return subCategoryList;
    }
  }

  // CATEGORY FEATURES
  Future<List<CategoryFeatureasModel>> categoryFeaturesCall(
      {required String categoryId}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/category_features?category_id[]=$categoryId')
     ,
      headers: Constants.headers,
    );

    List<CategoryFeatureasModel> categoryFeatureasList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      // debugPrint("RESPONSE DATA: ${response.body}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];
      var dataList = json.decode(response.body)["data"];

      if (status == true) {
      for (var categoryFeatureas in dataList) {
          categoryFeatureasList.add(CategoryFeatureasModel.fromJson(categoryFeatureas));
        }
        return categoryFeatureasList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return categoryFeatureasList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return categoryFeatureasList;
    }
  }
}
