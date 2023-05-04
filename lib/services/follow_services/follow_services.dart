import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/follow_services/my_follower_model.dart';
import 'package:b2geta_mobile/models/follow_services/my_following_model.dart';
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

  // UNFOLLOW
  Future<bool> unfollowCall({
    required String userId,
  }) async {
    final response =
        await http.post(Uri.parse('${Constants.apiUrl}/unfollow'), headers: {
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

  // MY FOLLOWERS
  Future<List<MyFollowerModel>> myFollowersCall({
    required Map<String, String> queryParameters,
  }) async {
    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/my-followers/${Constants.userId}')
            .replace(queryParameters: queryParameters),
        headers: Constants.headers);

    List<MyFollowerModel> myFollowersList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var data = json.decode(response.body)["data"]["data"];
        for (var element in data) {
          myFollowersList.add(MyFollowerModel.fromJson(element));
        }

        return myFollowersList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        return myFollowersList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return myFollowersList;
    }
  }

  // FOLLOWED ME (MY FOLLOWING)
  Future<List<MyFollowingModel>> followedMeCall({
    required Map<String, String> queryParameters,
  }) async {
    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/followed/${Constants.userId}')
            .replace(queryParameters: queryParameters),
        headers: Constants.headers);

    List<MyFollowingModel> myFollowingList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint(
          "RESPONSE DATA: ${jsonDecode(utf8.decode(response.bodyBytes))}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var data = json.decode(response.body)["data"]["data"];
        for (var element in data) {
          myFollowingList.add(MyFollowingModel.fromJson(element));
        }

        return myFollowingList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(response.body)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(response.body)["responseText"]}");
        return myFollowingList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return myFollowingList;
    }
  }
}
