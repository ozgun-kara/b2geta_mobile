import 'dart:convert';
import 'dart:io';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/categories/category_featureas_model.dart';
import 'package:b2geta_mobile/models/products/product_detail_edit_model.dart';
import 'package:b2geta_mobile/models/products/product_detail_model.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/model/retail_sale_model.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/model/whole_sale_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsServices {
  // PRODUCTS LIST AND SEARCH (ALL PRODUCT FOR MARKETPLACE PAGE ETC.)
  Future<List<ProductModel>> allProductsListAndSearchCall(
      {required Map<String, String> queryParameters}) async {
    final response = await http.get(Uri.parse('${Constants.apiUrl}/products')
        .replace(queryParameters: queryParameters));

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<ProductModel> productList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      // debugPrint("RESPONSE BODY: $responseBody");

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
      {required Map<String, String> queryParameters}) async {
    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/products')
            .replace(queryParameters: queryParameters),
        headers: Constants.headers);

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<ProductModel> productList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      //debugPrint("RESPONSE BODY: $responseBody");

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
        headers: Constants.headers);

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      // debugPrint(
      //     "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

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

  // GET PRODUCT (PRODUCT DETAIL)
  Future<ProductDetailEditModel?> getProductEditCall(
      {required String productId,
      required Map<String, String> queryParameters}) async {
    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/products/$productId')
            .replace(queryParameters: queryParameters),
        headers: Constants.headers);

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];
      if (status == true) {
        var data = json.decode(response.body)["data"];

        ProductDetailEditModel productDetailsModel =
            ProductDetailEditModel.fromJson(data);
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
      required List<String> categoriesList,
      required String productNameTR,
      required String productNameEN,
      required String productNameDE,
      required String productDescriptionTR,
      required String productDescriptionEN,
      required String productDescriptionDE,
      required String productSummaryTR,
      required String productSummaryEN,
      required String productSummaryDE,
      required String width,
      required String height,
      required String weight,
      required String saleRetail,
      required String saleWhole,
      required String length,
      required String brandName,
      String? brandId,
      required String status,
      required List<CategoryFeatureasModelFeatureValues> categoryFeatures,
      required List<RetailSaleModel> retailSaleList,
      required List<WholeSaleModel> wholeSaleList,
      required String gtip,
      required List<File> images}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.apiUrl}/products/create2'));
    request.headers.addAll(Constants.headers);
    request.fields["account_id"] = accountId;
    request.fields["user_id"] = Constants.userId!;
    for (var i = 0; i < categoriesList.length; i++) {
      request.fields["category_id[$i]"] = categoriesList[i];
    }
    request.fields["product_name[tr]"] = productNameTR;
    request.fields["product_name[en]"] = productNameEN;
    request.fields["product_name[de]"] = productNameDE;
    request.fields["product_description[tr]"] = productDescriptionTR;
    request.fields["product_description[en]"] = productDescriptionEN;
    request.fields["product_description[de]"] = productDescriptionDE;
    request.fields["product_summary[tr]"] = productSummaryTR;
    request.fields["product_summary[en]"] = productSummaryEN;
    request.fields["product_summary[de]"] = productSummaryDE;
    request.fields["width"] = width;
    request.fields["height"] = height;
    request.fields["weight"] = weight;
    request.fields["length"] = weight;
    if (brandId != null) {
      request.fields["brand"] = brandId;
    } else {
      request.fields["brand_name"] = brandName;
    }
    request.fields["sale_retail"] = saleRetail;
    request.fields["sale_whole"] = saleWhole;
    request.fields["status"] = status;
    request.fields["gtip"] = gtip;

    for (var i = 0; i < categoryFeatures.length; i++) {
      request.fields["feature[${categoryFeatures[i].attributeId!}][$i]"] =
          categoryFeatures[i].id!;
    }

    int j = 0;
    if (retailSaleList.isNotEmpty) {
      for (var i = 0; i < retailSaleList.length; i++) {
        request.fields["prices[$i][country]"] = retailSaleList[i].countryCode!;
        request.fields["prices[$i][quantity]"] = retailSaleList[i].quantity;
        request.fields["prices[$i][currency]"] = retailSaleList[i].currency!;
        request.fields["prices[$i][price]"] =
            retailSaleList[i].priceController.text;
        j++;
      }
    }

    if (wholeSaleList.isNotEmpty) {
      for (var i = 0; i < wholeSaleList.length; i++) {
        request.fields["prices[$j][country]"] = wholeSaleList[i].countryCode!;
        request.fields["prices[$j][quantity]"] =
            wholeSaleList[i].quantityController.text;
        request.fields["prices[$j][currency]"] = wholeSaleList[i].currency!;
        request.fields["prices[$j][price]"] =
            wholeSaleList[i].priceController.text;
        j++;
      }
    }

    List<http.MultipartFile> files = [];
    for (File file in images) {
      var f = await http.MultipartFile.fromPath('images[]', file.path);
      files.add(f);
    }
    request.files.addAll(files);

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("RESPONSE $responseString");

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      var status = json.decode(responseString)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(responseString)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(responseString)["responseText"]}");
        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return false;
    }
  }

  // UPDATE PRODUCT
  Future<bool> updateProductCall(
      {required String productId,
      required List<String> categoriesList,
      required String productNameTR,
      required String productNameEN,
      required String productNameDE,
      required String productDescriptionTR,
      required String productDescriptionEN,
      required String productDescriptionDE,
      required String productSummaryTR,
      required String productSummaryEN,
      required String productSummaryDE,
      required String width,
      required String height,
      required String weight,
      required String saleRetail,
      required String saleWhole,
      required String length,
      required String brandName,
      String? brandId,
      required String status,
      required List<CategoryFeatureasModelFeatureValues> categoryFeatures,
      required List<RetailSaleModel> retailSaleList,
      required List<WholeSaleModel> wholeSaleList,
      required String gtip}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.apiUrl}/products/update2/$productId'));
    request.headers.addAll(Constants.headers);

    for (var i = 0; i < categoriesList.length; i++) {
      request.fields["category_id[$i]"] = categoriesList[i];
    }

    request.fields["product_name[tr]"] = productNameTR;
    request.fields["product_name[en]"] = productNameEN;
    request.fields["product_name[de]"] = productNameDE;
    request.fields["product_description[tr]"] = productDescriptionTR;
    request.fields["product_description[en]"] = productDescriptionEN;
    request.fields["product_description[de]"] = productDescriptionDE;
    request.fields["product_summary[tr]"] = productSummaryTR;
    request.fields["product_summary[en]"] = productSummaryEN;
    request.fields["product_summary[de]"] = productSummaryDE;
    request.fields["width"] = width;
    request.fields["height"] = height;
    request.fields["weight"] = weight;
    request.fields["length"] = weight;
    if (brandId != null) {
      request.fields["brand"] = brandId;
    } else {
      request.fields["brand_name"] = brandName;
    }
    request.fields["sale_retail"] = saleRetail;
    request.fields["sale_whole"] = saleWhole;
    request.fields["status"] = status;
    request.fields["gtip"] = gtip;

    for (var i = 0; i < categoryFeatures.length; i++) {
      request.fields["feature[${categoryFeatures[i].attributeId!}][$i]"] =
          categoryFeatures[i].id!;
    }

    int j = 0;
    if (retailSaleList.isNotEmpty) {
      for (var i = 0; i < retailSaleList.length; i++) {
        request.fields["prices[$i][country]"] = retailSaleList[i].countryCode!;
        request.fields["prices[$i][quantity]"] = retailSaleList[i].quantity;
        request.fields["prices[$i][currency]"] = retailSaleList[i].currency!;
        request.fields["prices[$i][price]"] =
            retailSaleList[i].priceController.text;
        j++;
      }
    }

    if (wholeSaleList.isNotEmpty) {
      for (var i = 0; i < wholeSaleList.length; i++) {
        request.fields["prices[$j][country]"] = wholeSaleList[i].countryCode!;
        request.fields["prices[$j][quantity]"] =
            wholeSaleList[i].quantityController.text;
        request.fields["prices[$j][currency]"] = wholeSaleList[i].currency!;
        request.fields["prices[$j][price]"] =
            wholeSaleList[i].priceController.text;
        j++;
      }
    }

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("RESPONSE $responseString");

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      var status = json.decode(responseString)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(responseString)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(responseString)["responseText"]}");
        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return false;
    }
  }

  // UPDATE PRODUCT
  Future<bool> updateProductCallNew(
      {required String productId,
      required String categoryId,
      required String productName,
      required String productDescription,
      required String productSummary,
      required String brand,
      required String price,
      required String currency,
      required String status,
      required List<CategoryFeatureasModelFeatureValues> categoryFeatures,
      required List<File> images}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.apiUrl}/products/update/$productId'));
    request.headers.addAll(Constants.headers);

    request.fields["category_id[]"] = categoryId;
    request.fields["product_name[${Constants.language}]"] = productName;
    request.fields["product_description[${Constants.language}]"] =
        productDescription;
    request.fields["product_summary[${Constants.language}]"] = productSummary;
    request.fields["brand"] = brand;
    request.fields["price"] = price;
    request.fields["currency"] = currency;
    request.fields["status"] = status;

    // List<http.MultipartFile> files = [];
    // for (File file in images) {
    //   var f = await http.MultipartFile.fromPath('images[]', file.path);
    //   files.add(f);
    // }
    // request.files.addAll(files);

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("RESPONSE $responseString");

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      var status = json.decode(responseString)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(responseString)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(responseString)["responseText"]}");
        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return false;
    }
  }

  // DELETE PRODUCT
  Future<bool> deleteProductCall({
    required String productId,
  }) async {
    final response = await http.delete(
        Uri.parse('${Constants.apiUrl}/products/delete/$productId'),
        headers: Constants.headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // UPDATE PRODUCT IMAGE
  Future<bool> updateProductImageCall(
      {required String accountId,
      required String productId,
      required List<File> images}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.apiUrl}/products/upload_images'));
    request.headers.addAll(Constants.headers);

    request.fields["account_id"] = accountId;
    request.fields["user_id"] = Constants.userId!;
    request.fields["product_id"] = productId;

    List<http.MultipartFile> files = [];
    for (File file in images) {
      var f = await http.MultipartFile.fromPath('images[]', file.path);
      files.add(f);
    }

    request.files.addAll(files);
    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
