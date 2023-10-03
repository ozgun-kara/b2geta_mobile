// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/profile/company_profile_model.dart';
import 'package:b2geta_mobile/models/member/register_model.dart';
import 'package:b2geta_mobile/models/profile/personal_profile_model.dart';
import 'package:b2geta_mobile/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MemberServices {
  // REGISTER
  Future<String> registerCall({
    required String name,
    required String surname,
    required String phoneNumber,
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
        "phone_number": phoneNumber,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.body}");

      var status = json.decode(response.body)["status"];

      if (status == true) {
        var data = json.decode(response.body)["data"];
        var accessToken = json.decode(response.body)["access_token"];

        var result = RegisterModel.fromJson(data);

        return accessToken;
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
  Future<String> loginCall(
      {required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/member/login'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {"username": email, "password": password},
    );
    var responseText = json.decode(response.body)["responseText"];

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

        return '';
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return 'error';
      }
    } else if (responseText == 'UserAccessNotFound') {
      return 'UserAccessNotFound';
    } else if (responseText == 'UnVerifiedAccount') {
      return 'UnVerifiedAccount';
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return 'error';
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

  //GET PROFILE
  Future<UserModel?> getProfileCall() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/member/get'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var data = json.decode(response.body)["data"];

      if (status == true) {
        UserModel userModel = UserModel.fromJson(data);
        userModel.token = json.decode(response.body)["access_token"];
        return userModel;
      } else {
        return null;
      }
    } else {
      debugPrint(response.body);

      return null;
    }
  }

  //GET PERSONAL PROFILE
  Future<PersonalProfileModel?> getPersonalProfileCall(
      {required String userId}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/member/profile/$userId'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var data = json.decode(response.body)["data"];

      if (status == true) {
        PersonalProfileModel personalModel =
            PersonalProfileModel.fromJson(data);
        return personalModel;
      } else {
        return null;
      }
    } else {
      debugPrint("${response.body} ${Constants.userToken} id $userId");

      return null;
    }
  }

  //GET COMPANY PROFILE
  Future<CompanyProfileModel?> getCompanyProfileCall(
      {required String userId}) async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/company/profile/$userId'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Constants.userToken}",
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      var data = json.decode(response.body)["data"];

      if (status == true) {
        CompanyProfileModel companyProfileModel =
            CompanyProfileModel.fromJson(data);
        return companyProfileModel;
      } else {
        return null;
      }
    } else {
      debugPrint(response.body);

      return null;
    }
  }

  //FORGOT PASSWORD
  Future<bool> forgotPassword({required String email}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/member/forgot'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        'username': email,
      },
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // VERIFY
  Future<String> passwordVerifyCall({
    required String email,
    required String verifyCode,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/member/forgot/verify'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "username": email,
        "code": verifyCode,
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
      debugPrint(response.body);
      return 'VerificationCodeDoesNotMatch';
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.body}");
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return 'error';
    }
  }

  // RESEND
  Future<bool> reSendCall({required String email, required rToken}) async {
    final response = await http
        .post(Uri.parse('${Constants.apiUrl}/member/resend'), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $rToken",
    }, body: {
      'email': email,
    });

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        return false;
      }
    } else {
      debugPrint(response.body);

      return false;
    }
  }

  // UPDATE PASSWORD
  Future<bool> updatePasswordCall(
      {required String email,
      required String password,
      required String verifyCode}) async {
    final response = await http
        .post(Uri.parse('${Constants.apiUrl}/member/forgot/update'), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    }, body: {
      'username': email,
      'code': verifyCode,
      'password': password,
      'new_password': password,
    });

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // DELETE ACCOUNT
  Future<bool> deleteAccountCall() async {
    final response = await http.delete(
      Uri.parse('${Constants.apiUrl}/member/delete'),
      headers: Constants.headers,
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      if (status == true) {
        deleteToken();
        deleteUserId();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // PROFILE PHOTO SET
  Future<bool> profilePhotoSet({
    File? image,
  }) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.apiUrl}/member/photo'));
    request.headers.addAll(Constants.headers);

    // IMAGE CONTROL PART
    if (image != null) {
      if (image.path.isNotEmpty) {
        var i = await http.MultipartFile.fromPath('photo', image.path);
        request.files.add(i);
      }
    }

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    if (response.statusCode == 200) {
      var status = json.decode(responseString)["status"];

      if (status == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // PROFILE PHOTO DELETE
  Future<bool> deleteProfilePhoto() async {
    final response = await http.delete(
      Uri.parse('${Constants.apiUrl}/member/photo'),
      headers: Constants.headers,
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      if (status == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // UPDATE PROFILE
  Future<bool> updateProfileCall({
    required String firstname,
    required String lastname,
    required String citizenshipNumber,
    required String taxOffice,
    required String taxNumber,
    required String phoneNumber,
    required String country,
    required String cityId,
    required String districtId,
    required String address,
    required String postalCode,
    required String about,
    required String countryCode,
  }) async {
    final response = await http
        .post(Uri.parse('${Constants.apiUrl}/member/update'), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${Constants.userToken}",
    }, body: {
      'first_name': firstname,
      'last_name': lastname,
      'citizenship_number': citizenshipNumber,
      'tax_office': taxOffice,
      'tax_number': taxNumber,
      'phone_number': phoneNumber,
      'country': country,
      'country_code': countryCode,
      'city': cityId,
      'district': districtId,
      'address': address,
      'postal_code': postalCode,
      'about': about,
    });

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
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
    prefs.setString('P-Token', '');
    prefs.setString('P-ID', '');
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
