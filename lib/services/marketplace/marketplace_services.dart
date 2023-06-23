import 'dart:convert';

import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/marketplace/marketplace_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarketplaceServices {
  Future<MarketPlaceModel?> getData() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/marketplace'),
      headers: Constants.headers,
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    MarketPlaceModel marketPlaceModel;

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");
      // debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];
      var dataList = json.decode(response.body)["data"];
      if (status == true) {
        marketPlaceModel = MarketPlaceModel.fromJson(dataList);
        return marketPlaceModel;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return null;
    }
  }
}
