import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/products/product_detail_model.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsServices {
  // PRODUCTS LIST AND SEARCH (ALL PRODUCT FOR MARKETPLACE PAGE ETC.)
  Future<List<ProductModel>> allProductsListAndSearchCall(
      {required Map<String, String> queryParameters}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/products')
          .replace(queryParameters: queryParameters),
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<ProductModel> productList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");

      var status = responseBody["status"];

      if (status == true) {
        var dataList = responseBody["data"]['products'];

        for (var product in dataList) {
          productList.add(ProductModel.fromJson(product));
        }

        return productList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return productList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return productList;
    }
  }

  // PRODUCTS LIST AND SEARCH
  Future<List<ProductModel>> productsListAndSearchCall(
      {required Map<String, String> queryParameters,
      required String language}) async {
    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/products')
            .replace(queryParameters: queryParameters),
        headers: Constants.headers);

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<ProductModel> productList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");

      var status = responseBody["status"];
      var dataList = responseBody["data"]['products'];

      if (status == true) {
        for (var product in dataList) {
          productList.add(ProductModel.fromJson(product));
        }

        return productList;

        // var dataList = json.decode(response.body)["data"]['products'];
        // var totalData =
        // json.decode(response.body)["data"]['pagination']["total_data"];
        // var limit = int.parse(queryParameters["limit"] ?? "0");
        // totalData = int.parse(totalData);
        //
        // var dataCount = totalData > limit ? limit : totalData;
        //
        // for (var i = 0; i < dataCount; i++) {
        //   productList.add(dataList[i]["id"]);
        // }
        //
        // return productList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return productList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return productList;
    }
  }

  // GET PRODUCT (PRODUCT DETAIL)
  getProductCall(
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
        var data = json.decode(response.body)["data"];
        ProductDetailModel productDetailsModel =
            ProductDetailModel.fromJson(data);
        return productDetailsModel;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return null;
    }
  }

  // ADD PRODUCT
  Future<bool> addProductCall(
      {required String accountId,
      required String categoryId,
      required String productName,
      required String productDescription,
      required String productSummary,
      required String brand,
      required String price,
      required String currency,
      required String status}) async {
    final response = await http
        .put(Uri.parse('${Constants.apiUrl}/products/create'), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${Constants.userToken}",
    }, body: {
      "account_id": accountId,
      "user_id": Constants.userId,
      "category_id[]": categoryId,
      "product_name[tr]": productName,
      "product_description[tr]": productDescription,
      "product_summary[tr]": productSummary,
      "brand": brand,
      "price": price,
      "currency": currency,
      "status": status,
    });

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
      debugPrint("responseCode: ${json.decode(response.body)["responseCode"]}");
      debugPrint("responseText: ${json.decode(response.body)["responseText"]}");
      return false;
    }
  }

  // UPDATE PRODUCT
  Future<bool> updateProductCall(
      {required String productId,
      required String categoryId,
      required String productName,
      required String productDescription,
      required String productSummary,
      required String brand,
      required String price,
      required String currency,
      required String status}) async {
    final response = await http.post(
        Uri.parse('${Constants.apiUrl}/products/update/$productId'),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer ${Constants.userToken}",
        },
        body: {
          "category_id[]": categoryId,
          "product_name[tr]": productName,
          "product_description[tr]": productDescription,
          "product_summary[tr]": productSummary,
          "brand": brand,
          "price": price,
          "currency": currency,
          "status": status,
        });

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
      debugPrint("responseCode: ${json.decode(response.body)["responseCode"]}");
      debugPrint("responseText: ${json.decode(response.body)["responseText"]}");
      return false;
    }
  }

  // DELETE PRODUCT
  Future<bool> deleteProductCall({
    required String productId,
  }) async {
    final response = await http.delete(
      Uri.parse('${Constants.apiUrl}/products/delete/$productId'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
