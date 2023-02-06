import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/message_details_model.dart';
import 'package:b2geta_mobile/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessagesServices {
  // GET MESSAGES
  Future<List<MessageModel>> getMessagesCall({
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

    List<MessageModel> messageList = [];

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var messages = json.decode(response.body)["data"]["messages"];
      if (status == true) {
        for (var message in messages) {
          messageList.add(MessageModel.fromJson(message));
        }
        return messageList;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return messageList;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return messageList;
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
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/messages/2')
          .replace(queryParameters: queryParameters),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );
    List<MessageDetailsModel> messageDetailList = [];
    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");

      var status = json.decode(response.body)["status"];
      var messages = json.decode(response.body)["data"]["messages"];
      if (status == true) {
        for (var message in messages) {
          messageDetailList.add(MessageDetailsModel.fromJson(message));
        }
        debugPrint("${messageDetailList.length}sayi");

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

  Future<int> getTotal() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/messages/2?offset=0'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var total = json.decode(response.body)["data"]["summary"]["total"];
      if (status == true) {
        if (total is String) {
          return int.parse(total);
        }
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
