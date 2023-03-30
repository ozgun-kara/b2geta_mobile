import 'package:flutter/material.dart';

import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';

class SocialProvider with ChangeNotifier {
  List<FeedModel> feedsList = [];
  List<FeedModel> reelsList = [];
  List<FeedModel> myStoriesList = [];

  SocialProvider() {
    getFeeds();
    getReels();
    getMyStories();
  }

  String userId = '';

  void updateUserId(String value) {
    userId = value;
    notifyListeners();
  }

  void getFeeds() async {
    await locator<SocialServices>().getFeedCall(
        queryParameters: {"offset": "0", "limit": "25", "type": "feed"},
        userId: userId).then((feedList) {
      feedsList = feedList;
    });

    notifyListeners();
  }

  void getReels() async {
    await locator<SocialServices>().getReelsCall(
        queryParameters: {"offset": "0", "limit": "12", "type": "reels"},
        userId: userId).then((feedList) async {
      reelsList = feedList;
    });

    notifyListeners();
  }

  void getMyStories() async {
    await locator<SocialServices>().getAllMeStoryCall(
        queryParameters: {"offset": "0", "type": "story"},
        userId: userId).then((feedList) {
      myStoriesList = feedList;
    });

    notifyListeners();
  }
}
