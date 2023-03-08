import 'dart:convert';
import 'dart:io';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class SocialServices {
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
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");

        return false;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

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
        // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
        return false;
      }
    } else {
      // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");

      return false;
    }
  }

  // SHARE (FEED / STORY / REELS)
  Future<bool> shareCall(
      {required String type,
      required String content,
      List<File>? images,
      File? video,
      List<File>? videos}) async {
    final response =
        await http.post(Uri.parse('${Constants.apiUrl}/share'), headers: {
      "Authorization": "Bearer ${Constants.userToken}"
    }, body: {
      "type": type,
      "content": content,
      // "images": images,
      // "video": video,
      // "videos": videos
    });

    if (response.statusCode == 200) {
      var status = json.decode(response.body)["status"];
      debugPrint(status.toString());

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

  Future<bool> shareStoryCall({
    required File image,
  }) async {
    var request =
        http.MultipartRequest("POST", Uri.parse('${Constants.apiUrl}/share'));
    request.headers.addAll({"Authorization": "Bearer ${Constants.userToken}"});

    //add text fields
    request.fields["type"] = 'story';
    //create multipart using filepath, string or bytes
    var story = await http.MultipartFile.fromPath('images[]', image.path);
    //add multipart to request
    request.files.add(story);
    var streamedResponse = await request.send();
    //Get the response from the server
    var response = await http.Response.fromStream(streamedResponse);

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

  // // SHARE FEED TEST
  // Future<bool> shareFeedCallTest(
  //     {required String type, required String content}) async {
  //   final response =
  //       await http.post(Uri.parse('${Constants.apiUrl}/share'), headers: {
  //     "Authorization": "Bearer ${Constants.userToken}"
  //   }, body: {
  //     "type": type,
  //     "content": content,
  //   });
  //
  //   if (response.statusCode == 200) {
  //     var status = json.decode(response.body)["status"];
  //     debugPrint(status.toString());
  //
  //     if (status == true) {
  //       return true;
  //     } else {
  //       // throw ("DATA ERROR\nSTATUS CODE:  ${response.statusCode}");
  //
  //       return false;
  //     }
  //   } else {
  //     // throw ("API ERROR\nSTATUS CODE:  ${response.statusCode}");
  //
  //     return false;
  //   }
  // }

  // SHARE FEED
  shareFeedCall({
    String? content,
    List<XFile>? images,
  }) async {
    var request =
        http.MultipartRequest("POST", Uri.parse('${Constants.apiUrl}/share'));
    request.headers.addAll({"Authorization": "Bearer ${Constants.userToken}"});

    request.fields["type"] = 'feed';
    request.fields["content"] = content ?? '';

    // var images = await http.MultipartFile.fromPath("images[]", images.path);
    // request.files.add(images);

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("RESPONSE $responseString");
  }

  // SHARE REELS
  shareReelsCall({String? content, required File video}) async {
    var request =
        http.MultipartRequest("POST", Uri.parse('${Constants.apiUrl}/share'));

    request.headers.addAll({"Authorization": "Bearer ${Constants.userToken}"});
    request.fields["type"] = 'reels';
    request.fields["content"] = content ?? '';
    var reels = await http.MultipartFile.fromPath("video", video.path);
    request.files.add(reels);
    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("RESPONSE $responseString");
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
}
