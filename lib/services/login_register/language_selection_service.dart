import 'package:b2geta_mobile/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LanguageSelectionService {
  void func() async {
    var url = Uri.https(Constants.apiUrl, '/languages', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
