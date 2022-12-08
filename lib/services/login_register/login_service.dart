import 'dart:convert';
import 'dart:io';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final String BASE_URL = "https://api.businessucces.com/api/";

  void loginCall({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('https://api.businessucces.com/api/member/login'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 200) {
      // var result = LoginModel.fromJson(response.body);

      debugPrint("STATUS CODE: " + response.statusCode.toString());
      debugPrint("RESPONSE DATA: " + response.body.toString());
    } else {
      debugPrint("200 LOGIN ISTEGI ATILAMADI");

      // throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
