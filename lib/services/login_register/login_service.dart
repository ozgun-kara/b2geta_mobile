import 'dart:convert';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class LoginService {
  // Future<LoginModel> fetch() async {
  //   var uri = Uri.https(Constants.apiUrl, "/member/login");
  //
  //   final response = await http.get(uri);
  //
  //   if (response.statusCode == 200) {
  //     Map<dynamic, dynamic> data = json.decode(response.body);
  //
  //     return LoginModel.fromJson(data);
  //   } else {
  //     throw Exception('Error');
  //   }
  // }

  // Future<LoginModel> fetch2() async {
  //   final response = await http
  //       .get(Uri.parse('https://api.businessucces.com.tr/api/member/login'));
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return LoginModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  final dio = Dio();

  Future<LoginModel> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "password": password};

    var response = await dio
        .post("https://api.businessucces.com/api/member/login", data: json);

    if (response.statusCode == 200) {
      var result = LoginModel.fromJson(response.data);

      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
