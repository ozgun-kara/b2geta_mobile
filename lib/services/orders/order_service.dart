import 'dart:convert';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:http/http.dart' as http;

class OrderService {
  Future<List?> createOrderCall(
      {required Map<String, String> requestBody}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/orders/create'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: requestBody,
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      if (status == true) {
        List data = json.decode(response.body)["data"];
        return data;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE:  ${response.body}");

      return null;
    }
  }
}
