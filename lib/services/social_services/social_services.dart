import 'dart:convert';
import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class SocialServices {
  // FEED LİST
  Future<List<FeedModel>> getAllFeedCall(
      {required Map<String, String> queryParameters}) async {
    List<FeedModel> feedList = [];

    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/feeds/57')
          .replace(queryParameters: queryParameters),
      headers: {"Authorization": "Bearer ${Constants.userToken}"},
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        var dataList = json.decode(response.body)["data"]["feeds"];
        int limit = jsonDecode(response.body)["data"]["limit"];
        for (var i = 0; i < 13; i++) {
          feedList.add(FeedModel.fromJson(dataList[i]));
        }
        return feedList;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return feedList;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return feedList;
    }
  }
}
