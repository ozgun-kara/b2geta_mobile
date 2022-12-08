import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "https://api.businessucces.com/api";
  var status;

  var loginResponse;

  var token;

  loginData(String email, String password) async {
    var uri = Uri.https(serverUrl, "/member/login");

    final response = await http.post(uri,
        headers: {'Accept': 'application/json'},
        body: {"username": email, "password": password});

    // status = response.body.contains('error');

    loginResponse = response;

    var data = json.decode(response.body);


    print("YANIT: " + loginResponse.statusCode.toString());

    // if (status) {
    //   print('data : ${data["error"]}');
    // } else {
    //   print('data : ${data["token"]}');
    //   _save(data["token"]);
    // }
  }

  //////////////////////////////////////////////////////////////////////////

  // registerData(String name, String email, String password) async {
  //   String myUrl = "$serverUrl/register1";
  //   final response = await http.post(myUrl,
  //       headers: {'Accept': 'application/json'},
  //       body: {"name": "$name", "email": "$email", "password": "$password"});
  //   status = response.body.contains('error');
  //
  //   var data = json.decode(response.body);
  //
  //   if (status) {
  //     print('data : ${data["error"]}');
  //   } else {
  //     print('data : ${data["token"]}');
  //     _save(data["token"]);
  //   }
  // }

  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    var uri = Uri.https(serverUrl, "/products/");

    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    return json.decode(response.body);
  }

  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    var uri = Uri.https(serverUrl, "/products/$id");

    http.delete(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void addData(String name, String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    var uri = Uri.https(serverUrl, "/products");

    http.post(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "name": "$name",
      "price": "$price"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void editData(int id, String name, String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    var uri = Uri.https(serverUrl, "/products/$id");

    http.put(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "name": "$name",
      "price": "$price"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  //////////////////////////////////////////////////////////////////////////

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
