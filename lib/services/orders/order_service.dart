import 'dart:convert';
import 'package:b2geta_mobile/models/orders/order_details_model.dart';
import 'package:b2geta_mobile/models/orders/order_model.dart';
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
        debugPrint("DATA:  ${response.statusCode} ${data.toString()}");
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

  Future<List<OrderModel>> getOrderCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/orders'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    List<OrderModel> orderList = [];

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      if (status == true) {
        List data = json.decode(response.body)["data"]["orders"];
        int limit = jsonDecode(response.body)["data"]["summary"]["limit"];
        int total =
            int.parse(jsonDecode(response.body)["data"]["summary"]["total"]);
        var dataListLength = total > limit ? limit : total;

        for (var i = 0; i < dataListLength; i++) {
          orderList.add(OrderModel.fromJson(data[i]));
        }
        return orderList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return orderList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE:  ${response.body}");

      return orderList;
    }
  }

  Future<OrderDetailsModel?> getOrderDetailCall(
      {required String orderId}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/orders/$orderId'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      if (status == true) {
        var data = json.decode(response.body)["data"];
        var orderDetails = OrderDetailsModel.fromJson(data);
        return orderDetails;
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
