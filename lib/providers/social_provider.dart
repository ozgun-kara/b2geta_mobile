import 'package:flutter/material.dart';

import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';

class SocialProvider with ChangeNotifier {
  List<FeedModel> feedsList = [];
  List<FeedModel> reelsList = [];
  List<FeedModel> myStoriesList = [];

  void getFeeds({required String userId}) async {
    await locator<SocialServices>().getFeedCall(queryParameters: {
      "offset": "0",
      "limit": "100000000000",
      "type": "feed"
    }, userId: userId).then((feedList) {
      feedsList = feedList;
    });

    notifyListeners();
  }

  void getReels({required String userId}) async {
    await locator<SocialServices>().getReelsCall(queryParameters: {
      "offset": "0",
      "limit": "100000000000",
      "type": "reels"
    }, userId: userId).then((feedList) async {
      reelsList = feedList;
    });

    notifyListeners();
  }

  void getMyStories({required String userId}) async {
    await locator<SocialServices>().getAllMeStoryCall(
        queryParameters: {"offset": "0", "type": "story"},
        userId: userId).then((feedList) {
      myStoriesList = feedList;
    });

    notifyListeners();
  }
}
