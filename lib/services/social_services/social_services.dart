import 'dart:convert';
import 'dart:io';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/models/social/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SocialServices {
  // SHARE (FEED / STORY / REELS)
  Future<bool> shareCall(
      {required String type,
      String? content,
      List<File>? images,
      File? video}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${Constants.apiUrl}/share'));
    request.headers.addAll({"Authorization": "Bearer ${Constants.userToken}"});
    request.fields["type"] = type;
    request.fields["content"] = content ?? '';

    // IMAGE CONTROL PART
    if (images != null) {
      if (images.isNotEmpty) {
        List<http.MultipartFile> files = [];
        for (File file in images) {
          var f = await http.MultipartFile.fromPath('images[]', file.path);
          files.add(f);
        }
        request.files.addAll(files);
      }
    }

    // REELS CONTROL PART
    if (video != null) {
      var reels = await http.MultipartFile.fromPath("video", video.path);
      request.files.add(reels);
    }

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("RESPONSE $responseString");

    if (response.statusCode == 200) {
      debugPrint("STATUS CODE: ${response.statusCode}");
      var status = json.decode(responseString)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE: ${response.statusCode}");
        debugPrint(
            "responseCode: ${json.decode(responseString)["responseCode"]}");
        debugPrint(
            "responseText: ${json.decode(responseString)["responseText"]}");
        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE: ${response.statusCode}");
      return false;
    }
  }

  // FEED LIST
  Future<List<FeedModel>> getAllFeedCall(
      {required Map<String, String> queryParameters}) async {
    List<FeedModel> feedList = [];

    try {
      final response = await http.get(
        Uri.parse('${Constants.apiUrl}/feeds')
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
    } catch (e) {
      debugPrint("Error!!! {$e.toString}");
      return feedList;
    }
  }

  // FEED LIST
  Future<List<FeedModel>> getFeedCall(
      {required Map<String, String> queryParameters,
      required String userId}) async {
    List<FeedModel> feedList = [];

    try {
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
    } catch (e) {
      debugPrint("Error!!! {$e.toString}");
      return feedList;
    }
  }

  // REELS LIST
  Future<List<FeedModel>> getAllReelsCall(
      {required Map<String, String> queryParameters}) async {
    List<FeedModel> feedList = [];

    try {
      final response = await http.get(
        Uri.parse('${Constants.apiUrl}/feeds/')
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
    } catch (e) {
      debugPrint("Error !!! {$e.toString}");
      return feedList;
    }
  }

  // REELS LIST
  Future<List<FeedModel>> getReelsCall(
      {required Map<String, String> queryParameters,
      required String userId}) async {
    List<FeedModel> feedList = [];

    try {
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
    } catch (e) {
      debugPrint("Error !!! {$e.toString}");
      return feedList;
    }
  }

  // STORY LIST
  Future<List<FeedModel>> getAllStoryCall(
      {required Map<String, String> queryParameters}) async {
    List<FeedModel> feedList = [];

    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/feeds')
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

  // ME STORY LIST
  Future<List<FeedModel>> getAllMeStoryCall(
      {required Map<String, String> queryParameters,
      required String userId}) async {
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

  // Discover LIST
  Future<List<FeedModel>> getDiscover(
      {required Map<String, String> queryParameters}) async {
    List<FeedModel> feedList = [];

    try {
      final response = await http.get(
        Uri.parse('${Constants.apiUrl}/feeds')
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
    } catch (e) {
      debugPrint("Error !!! {$e.toString}");
      return feedList;
    }
  }

  // FEED LIKE
  Future<bool> feedLikeCall({required String feedId}) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/like/$feedId'),
      headers: {"Authorization": "Bearer ${Constants.userToken}"},
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE:  ${response.statusCode} ");

        return false;
      }
    } else {
      debugPrint("API ERROR\nSTATUS CODE:  ${response.statusCode}");
      return false;
    }
  }

  // FEED UNLIKE
  Future<bool> feedUnLikeCall({required String feedId}) async {
    final response = await http.delete(
      Uri.parse('${Constants.apiUrl}/unlike/$feedId'),
      headers: {"Authorization": "Bearer ${Constants.userToken}"},
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        debugPrint("DATA ERROR\nSTATUS CODE:  ${response.statusCode} ");

        return false;
      }
    } else {
      debugPrint("DATA ERROR\nSTATUS CODE:  ${response.body} ");
      return false;
    }
  }

  //GET COMMENTS
  Future<List<FeedModelCommentsComments>> getCommentsCall(
      {required String feedId}) async {
    List<FeedModelCommentsComments> feedCommentList = [];

    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/comments/$feedId'),
      headers: {"Authorization": "Bearer ${Constants.userToken}"},
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        var dataList = json.decode(response.body)["data"]["comments"];
        for (var i = 0; i < dataList.length; i++) {
          feedCommentList.add(FeedModelCommentsComments.fromJson(dataList[i]));
        }

        return feedCommentList;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return feedCommentList;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return feedCommentList;
    }
  }

  // CREATE COMMENT
  Future<bool> createCommentCall({
    required String content,
    required String feedId,
  }) async {
    final response = await http
        .post(Uri.parse('${Constants.apiUrl}/comment/$feedId'), headers: {
      "Authorization": "Bearer ${Constants.userToken}"
    }, body: {
      "type": "posts",
      "content": content,
    });

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return false;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return false;
    }
  }

  // DELETE COMMENT
  Future<bool> deleteCommentCall({
    required String commentId,
  }) async {
    final response = await http.delete(
        Uri.parse('${Constants.apiUrl}/comment/$commentId'),
        headers: {"Authorization": "Bearer ${Constants.userToken}"});

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        return true;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return false;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return false;
    }
  }

  //GET NOTIFICATION
  Future<List<NotificationModel>> getNotifications({
    required Map<String, String> queryParameters,
  }) async {
    List<NotificationModel> notifications = [];

    final response = await http.get(
        Uri.parse('${Constants.apiUrl}/notifications')
            .replace(queryParameters: queryParameters),
        headers: {
          "Authorization": "Bearer ${Constants.userToken}",
          "Accept-Language": "tr"
        });
    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];

      if (status == true) {
        var dataList = json.decode(response.body)["data"]["notifications"];
        for (var i = 0; i < dataList.length; i++) {
          notifications.add(NotificationModel.fromJson(dataList[i]));
        }
        return notifications;
      } else {
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return notifications;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return notifications;
    }
  }
}
