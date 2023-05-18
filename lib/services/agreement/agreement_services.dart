import 'dart:convert';

import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgreementServices {
  //Clarification Text
  Future<String?> clarificationTextCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/aggrements/clarificationtext'),
      headers: {
        "Accept-Language": Constants.language ?? '',
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var content = json.decode(response.body)["data"]["content"];
      if (status == true) {
        return content;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return null;
    }
  }

  //Distance Sales Agreement
  Future<String?> distanceSalesAgreementCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/aggrements/distancesalesagreement'),
      headers: {
        "Accept-Language": Constants.language ?? '',
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var content = json.decode(response.body)["data"]["content"];
      if (status == true) {
        return content;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return null;
    }
  }

  //Prior Information Distance Sales
  Future<String?> priorInformationDistanceSalesAgreementCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/aggrements/priorinformationdistancesales'),
      headers: {
        "Accept-Language": Constants.language ?? '',
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var content = json.decode(response.body)["data"]["content"];
      if (status == true) {
        return content;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return null;
    }
  }

  //Privacy Policy
  Future<String?> privacyPolicyCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/aggrements/privacy'),
      headers: {
        "Accept-Language": Constants.language ?? '',
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var content = json.decode(response.body)["data"]["content"];
      if (status == true) {
        return content;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return null;
    }
  }

  //Delivery and Return
  Future<String?> deliveryAndReturnPolicyCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/aggrements/delivery'),
      headers: {
        "Accept-Language": Constants.language ?? '',
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var content = json.decode(response.body)["data"]["content"];
      if (status == true) {
        return content;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return null;
    }
  }
}
