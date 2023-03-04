// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/member/register_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MemberServices {
  // REGISTER
  Future<String> registerCall({
    required String name,
    required String surname,
    required String email,
    required String password,
    String? companyName,
    String? officialPerson,
    String? officialPhone,
    String? country,
  }) async {
    final response = await http.put(
      Uri.parse('${Constants.apiUrl}/member'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "type": "personal",
        "firstname": name,
        "lastname": surname,
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var data = json.decode(response.body)["data"];

        var result = RegisterModel.fromJson(data);

        debugPrint("userId: ${result.userId}");
        debugPrint("verifyCode: ${result.verifyCode}");

        return result.verifyCode.toString();
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return "error";
      }
    } else if (response.statusCode == 409) {
      return "EmailAlreadyExists";
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return "error";
    }
  }

  // VERIFY
  Future<String> verifyCall({
    required String email,
    required String verifyCode,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/member/verify'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "email": email,
        "verify_code": verifyCode,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        return '';
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return 'error';
      }
    } else if (response.statusCode == 400) {
      return 'VerificationCodeDoesNotMatch';
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.body}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return 'error';
    }
  }

  // LOGIN
  Future<bool> loginCall(
      {required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/member/login'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

      // var result = LoginModel.fromJson(response.body);

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var token = json.decode(response.body)["access_token"];
        debugPrint("TOKEN: $token");
        Constants.userToken = token;
        saveToken(token);

        var userId = json.decode(response.body)["data"]["user_id"];
        debugPrint("USER ID: $userId");
        Constants.userId = userId;
        saveUserId(userId);

        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return false;
    }
  }

  // LOGOUT
  Future<bool> logoutCall() async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/member/logout'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        deleteToken();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // TOKEN FUNCTIONS
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Token', token);
    debugPrint("TOKEN HAS SAVED");
    readToken();
  }

  Future<String?> readToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('Token');
    debugPrint("TOKEN HAS FETCHED: $token");
    return token;
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Token', '');
    debugPrint("TOKEN HAS DELETED");
  }

  // THESE FUNCTIONS WILL BE DELETED WHEN THE "USER MODEL" IS READY
  Future<void> saveUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserId', userId);
    debugPrint("USER ID HAS SAVED");
    readUserId();
  }

  Future<String?> readUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    debugPrint("USER ID HAS FETCHED: $userId");
    return userId;
  }

  Future<void> deleteUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserId', '');
    debugPrint("USER ID  HAS DELETED");
  }
}
