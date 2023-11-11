import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/messages/message_details_model.dart';
import 'package:b2geta_mobile/models/messages/message_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessagesServices {
  // GET MESSAGES
  Future<Map<String, dynamic>> getMessagesCall({
    required Map<String, String> queryParameters,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/messages')
          .replace(queryParameters: queryParameters),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
        "Accept-Language": "${Constants.language}"
      },
    );

    List<MessageModel> messageList = [];
    String total = "0";

    Map<String, dynamic> result = {
      "messageList": messageList,
      "total": total,
    };

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var messages = json.decode(response.body)["data"]["messages"];
      var totalData = json.decode(response.body)["data"]["summary"]["total"];
      if (status == true) {
        for (var message in messages) {
          messageList.add(MessageModel.fromJson(message));
        }

        return {"messageList": messageList, "total": totalData};
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return result;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return result;
    }
  }

  // SEND MESSAGE
  Future<bool> sendMessageCall({
    required String toId,
    required String message,
  }) async {
    final response = await http
        .put(Uri.parse('${Constants.apiUrl}/messages/send'), headers: {
      "Authorization": "Bearer ${Constants.userToken}",
      "Accept-Language": "${Constants.language}"
    }, body: {
      "to_id": toId,
      "message": message,
    });

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return false;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return false;
    }
  }

  // GET MESSAGE DETAIL
  Future<List<MessageDetailsModel>> getMessageDetailCall({
    required Map<String, String> queryParameters,
    required String messageId,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/messages/$messageId')
          .replace(queryParameters: queryParameters),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
        "Accept-Language": "${Constants.language}"
      },
    );
    List<MessageDetailsModel> messageDetailList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");

      var status = json.decode(response.body)["status"];
      var messages = json.decode(response.body)["data"]["messages"];
      var total = json.decode(response.body)["data"]["summary"]["total"];
      var limit = int.parse(queryParameters["limit"] ?? "0");

      if (total is String) {
        total = int.parse(total);
      }

      var dataCount = total > limit ? limit : total;
      if (status == true) {
        for (int i = 0; i < dataCount; i++) {
          messageDetailList.add(MessageDetailsModel.fromJson(messages[i]));
        }

        return messageDetailList;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return messageDetailList;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return messageDetailList;
    }
  }

  Future<int> getTotalMessageCall({required String messageId}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/messages/$messageId'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
        "Accept-Language": "${Constants.language}"
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");

      var status = json.decode(response.body)["status"];
      var total = json.decode(response.body)["data"]["summary"]["total"];

      if (total is String) {
        total = int.parse(total);
      }
      if (status == true) {
        return total;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return 0;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return 0;
    }
  }
}
