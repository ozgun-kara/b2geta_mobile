import 'dart:convert';
import 'package:b2geta_mobile/models/feed_model.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class SocialServices {
  // FEED LİST
  Future<List<FeedModel>> getAllFeedCall(
      {required Map<String, String> queryParameters,required String userId}) async {
    List<FeedModel> feedList = [];

    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/feeds/$userId')
          .replace(queryParameters: queryParameters),
      headers: {"Authorization": "Bearer ${Constants.userToken}"},
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        var dataList = json.decode(response.body)["data"]["feeds"];
        int limit = jsonDecode(response.body)["data"]["limit"];
        int total = jsonDecode(response.body)["data"]["total"];
        var dataListLength = total > limit ? limit : total;
        for (var i = 0; i < dataListLength; i++) {
          feedList.add(FeedModel.fromJson(dataList[i]));
        }
        return feedList;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return feedList;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return feedList;
    }
  }
}
