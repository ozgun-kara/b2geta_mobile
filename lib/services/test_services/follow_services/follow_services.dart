import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FollowServices {
  // FOLLOW
  Future<bool> followCall({
    required String userId,
  }) async {
    final response =
        await http.post(Uri.parse('${Constants.apiUrl}/follow'), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${Constants.userToken}",
    }, body: {
      "user_id": userId
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

  // SEND MESSAGE
  Future<bool> sendMessageCall({
    required String toId,
    required String message,
  }) async {
    final response = await http
        .put(Uri.parse('${Constants.apiUrl}/messages/send'), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${Constants.userToken}",
    }, body: {
      "to_id": toId,
      "message": message,
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
      return false;
    }
  }

  // GET MESSAGE DETAIL
  Future<bool> getMessageDetailCall({
    required Map<String, String> queryParameters,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/messages')
          .replace(queryParameters: queryParameters),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
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
