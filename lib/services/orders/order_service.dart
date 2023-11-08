import 'dart:convert';
import 'package:b2geta_mobile/models/orders/order_details_model.dart';
import 'package:b2geta_mobile/models/orders/order_model.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class OrderService {
  Future<dynamic> createOrderCall(
      {required Map<String, String> requestBody}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/orders/create'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: requestBody,
    );

    var status = json.decode(response.body)["status"];

    if (response.statusCode == 200) {
      if (status == true) {
        var htmlData = json.decode(response.body)["data"];

        return htmlData;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE:  ${response.body}");

      return null;
    }
  }

  Future<List<OrderModel>> getMyOrdersCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/orders'),
      headers: Constants.headers,
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

  Future<List<OrderModel>> getMyOrdersCallTest() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/orders'),
      headers: {
        // "Authorization": "Bearer ${Constants.userToken}",

        "Authorization":
            "Bearer nzdngvtcmbmhtkjvlryauagpefmzybhtfjuqmpvgxmmbqvjopotusvglmgbyxdzc",
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

  Future<List<OrderModel>> getMyIncomingOrdersCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/orders/incoming'),
      headers: Constants.headers,
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

  Future<bool> updateOrderCall(
      {required String orderId,
      required String orderStatus,
      String? invoiceNo,
      String? invoiceUrl,
      String? invoiceDate}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.apiUrl}/orders/update/$orderId'));
    request.headers.addAll(Constants.headers);

    request.fields["status"] = orderStatus;
    if (invoiceNo != null && invoiceNo.isNotEmpty) {
      request.fields["invoice_no"] = invoiceNo;
    }

    if (invoiceUrl != null && invoiceUrl.isNotEmpty) {
      request.fields["invoice_url"] = invoiceUrl;
    }

    if (invoiceDate != null && invoiceDate.isNotEmpty) {
      request.fields["invoice_date"] = invoiceDate;
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
