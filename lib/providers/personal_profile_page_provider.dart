import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';

class PersonalProfilePageProvider with ChangeNotifier {
  int currentTabIndex = 4;
  List<FeedModel> feedsList = [];
  List<FeedModel> reelsList = [];
  List<FeedModel> myStoriesList = [];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }

  void getFeeds({required String userId}) async {
    await locator<SocialServices>().getFeedCall(
        queryParameters: {"offset": "0", "limit": "25", "type": "feed"},
        userId: userId).then((feedList) {
      feedsList = feedList;
    });

    notifyListeners();
  }

  void getReels({required String userId}) async {
    await locator<SocialServices>().getReelsCall(
      queryParameters: {"offset": "0", "limit": "12", "type": "reels"},
      userId: userId,
    ).then((feedList) async {
      reelsList = feedList;
    });

    notifyListeners();
  }

  void getMyStories(String userId) async {
    await locator<SocialServices>().getAllMeStoryCall(
        queryParameters: {"offset": "0", "type": "story"},
        userId: userId).then((feedList) {
      myStoriesList = feedList;
    });

    notifyListeners();
  }

  bool filterSwitch = true;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }
}
