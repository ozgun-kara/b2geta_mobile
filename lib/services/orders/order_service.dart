import 'dart:convert';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class OrderService {
  Future<bool> createOrderCall(
      {required Map<String, String> requestBody}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/orders/create'),
      headers: {
        "Authorization": "Bearer ${Constants.userToken}",
      },
      body: requestBody,
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      if (status == true) {
        return true;
      } else {
        // debugPrint("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return false;
      }
    } else {
      //debugPrint("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return false;
    }
  }
}
