import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/member/address_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MemberAddressesServices {
  // GET ALL
  Future<List<AddressModel>> getAllCall(
      {required Map<String, String> queryParameters}) async {
    List<AddressModel> addressList = [];
    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/member/addresses')
            .replace(queryParameters: queryParameters),
        headers: {
          "Authorization": "Bearer ${Constants.userToken}",
        });

    if (response.statusCode == 200) {
      // debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];
      var dataList = json.decode(response.body)["data"];
      if (status == true) {
        for (var address in dataList) {
          addressList.add(AddressModel.fromMap(address));
        }

        return addressList;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return addressList;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return addressList;
    }
  }

  // GET ALL
  Future<bool> getCall({required String id}) async {
    final response = await http
        .get(Uri.parse('${Constants.apiUrl}/member/addresses/$id'), headers: {
      "Authorization": "Bearer ${Constants.userToken}",
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

  // ADD AN ADDRESS
  Future<bool> addAddressCall({
    required String name,
    required String country,
    required String city,
    required String district,
    required String address,
    required String postalCode,
  }) async {
    final response = await http
        .post(Uri.parse('${Constants.apiUrl}/member/addresses/add'), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${Constants.userToken}",
    }, body: {
      "name": name,
      "country": country,
      "city": city,
      "district": district,
      "address": address,
      "postal_code": postalCode,
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

  // UPDATE AN ADDRESS
  Future<bool> updateAddressCall({
    required String id,
    required String name,
    required String country,
    required String city,
    required String district,
    required String address,
    required String postalCode,
  }) async {
    final response = await http.post(
        Uri.parse('${Constants.apiUrl}/member/addresses/update/$id'),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer ${Constants.userToken}",
        },
        body: {
          "name": name,
          "country": country,
          "city": city,
          "district": district,
          "address": address,
          "postal_code": postalCode,
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

  // DELETE AN ADDRESS
  Future<bool> deleteAddressCall({
    required String id,
  }) async {
    final response = await http.delete(
        Uri.parse('${Constants.apiUrl}/member/addresses/delete/$id'),
        headers: {
          "Authorization": "Bearer ${Constants.userToken}",
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
}
