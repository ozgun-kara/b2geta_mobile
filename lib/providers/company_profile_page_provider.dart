import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';

class CompanyProfilePageProvider with ChangeNotifier {
  int currentTabIndex = 4;
  List<FeedModel> feeds = [];
  List<FeedModel> reelsList = [];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }

  void getFeeds() async {
    await locator<SocialServices>().getAllFeedCall(
        queryParameters: {"offset": "0", "limit": "25", "type": "feed"},
        userId: Constants.userId!).then((feedList) {
      feeds = feedList;
    });

    notifyListeners();
  }

  void getReels() async {
    await locator<SocialServices>().getAllReelsCall(
      queryParameters: {"offset": "0", "limit": "12", "type": "reels"},
    ).then((feedList) async {
      reelsList = feedList;
    });

    notifyListeners();
  }

  bool filterSwitch = true;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }
}
