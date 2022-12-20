import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyServices {
  // ADD COMPANY
  Future<bool> addCompanyCall({
    required String companyName,
    String? taxOffice,
    required String taxNumber,
    String? phoneNumber,
    required String email,
    required String wantEmail,
    String? country,
    required String city,
    required String district,
    String? address,
    String? postalCode,
    required String about,
    String? languageCode,
    String? countryCode,
    required String timezone,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/company/add'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
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
