import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/company/company_detail_model.dart';
import 'package:b2geta_mobile/models/company/company_model2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CompanyServices {
  // LIST MY COMPANIES
  Future<List<CompanyModel2>> listMyCompaniesCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/company/list'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    List<CompanyModel2> companiesList = [];

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");
      // debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];
      var dataList = json.decode(response.body)["data"];
      if (status == true) {
        for (var company in dataList) {
          companiesList.add(CompanyModel2.fromJson(company));
        }

        return companiesList;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return companiesList;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return companiesList;
    }
  }

  // PROFILE GET (COMPANY DETAIL)
  profileGetCall({required String companyId}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/company/profile/$companyId'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE BODY: $responseBody");
      // debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var data = json.decode(response.body)["data"];
        CompanyDetailModel companyDetailModel =
            CompanyDetailModel.fromJson(data);
        return companyDetailModel;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint("responseCode: ${responseBody["responseCode"]}");
        debugPrint("responseText: ${responseBody["responseText"]}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return null;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return null;
    }
  }

  // ADD COMPANY
  Future<bool> addCompanyCall({
    required String companyName,
    required String taxOffice,
    required String taxNumber,
    required String phoneNumber,
    required String email,
    required String wantEmail,
    required String country,
    required String city,
    required String district,
    required String address,
    required String postalCode,
    required String about,
    required String languageCode,
    required String countryCode,
    required String timezone,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/company/add'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: {
        "company_name": companyName,
        "tax_office": taxOffice,
        "tax_number": taxNumber,
        "phone_number": phoneNumber,
        "email": email,
        "want_email": wantEmail,
        "country": country,
        "city": city,
        "district": district,
        "address": address,
        "postal_code": postalCode,
        "about": about,
        "language_code": languageCode,
        "country_code": countryCode,
        "timezone": timezone
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // UPDATE COMPANY
  Future<bool> updateCompanyCall({
    required String id,
    required String companyName,
    required String taxOffice,
    required String taxNumber,
    required String phoneNumber,
    required String email,
    required String wantEmail,
    required String country,
    required String city,
    required String district,
    required String address,
    required String postalCode,
    required String about,
    required String languageCode,
    required String countryCode,
    required String timezone,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/company/update/$id'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: {
        "company_name": companyName,
        "tax_office": taxOffice,
        "tax_number": taxNumber,
        "phone_number": phoneNumber,
        "email": email,
        "want_email": wantEmail,
        "country": country,
        "city": city,
        "district": district,
        "address": address,
        "postal_code": postalCode,
        "about": about,
        "language_code": languageCode,
        "country_code": countryCode,
        "timezone": timezone
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // INVITE
  Future<bool> inviteCall({
    required String companyId,
    required String email,
    required String userId,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/company/invite'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: {
        "company_id": companyId,
        "email": email,
        "user_id": userId,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // AWAIT COMPANY LIST
  Future<bool> awaitCompanyListCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/company/await_list'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // INVITES
  Future<bool> invitesCall({
    required int companyId,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/company/invites/$companyId'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // APPROVE INVITE
  Future<bool> approveInviteCall({
    required String companyId,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/company/approve_invite'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: {
        "company_id": companyId,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // REJECT INVITE
  Future<bool> rejectInviteCall({
    required String companyId,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/company/reject_invite'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: {
        "company_id": companyId,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // DELETE INVITE
  Future<bool> deleteInviteCall({
    required String companyId,
    required String userId,
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/company/delete_invite'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: {
        "company_id": companyId,
        "user_id": companyId,
        "email": companyId,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

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

  // CHANGE PROFILE ANOTHER COMPANY
  Future<bool> changeProfileAnotherCompanyCall({
    required String userId,
  }) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/member/change/$userId'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        String accessToken = json.decode(response.body)["access_token"];
        String userId = json.decode(response.body)["data"]["user_id"].toString();

        final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString("P-Token", Constants.userToken.toString());
        prefs.setString("P-ID", Constants.userId.toString());

        prefs.setString('Token', accessToken);
        prefs.setString('UserId', userId);

        Constants.userToken = accessToken;
        Constants.userId = userId;

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
