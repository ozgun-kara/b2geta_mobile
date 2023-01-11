import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsServices {
  // PRODUCTS LIST AND SEARCH
  Future<List<String>> productsListAndSearchCall(
      {required Map<String, String> queryParameters}) async {
    List<String> productList = [];

    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/products')
          .replace(queryParameters: queryParameters),
      headers: {"Authorization": "Bearer ${Constants.userToken}"},
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        var dataList = json.decode(response.body)["data"]['products'];

        for (var i = 0; i < 10; i++) {
          productList.add(dataList[i]["id"]);
        }

        return productList;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return productList;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return productList;
    }
  }

  // GET PRODUCTS
  Future<bool> getProductsCall(
      {required String productId,
      required Map<String, String> queryParameters}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/products/$productId')
          .replace(queryParameters: queryParameters),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
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
