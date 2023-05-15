import 'package:flutter/material.dart';

import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';

class SocialProvider with ChangeNotifier {
  List<FeedModel> feedsList = [];
  List<FeedModel> reelsList = [];
  List<FeedModel> discoverList = [];
  List<FeedModel> myStoriesList = [];

  final int _limit = 30;
  int _offset = 0;
  int _page = 0;
  bool _isMoreData = true;
  get isMoreData => _isMoreData;

  void getDiscover() async {
    await locator<SocialServices>().getDiscover(
      queryParameters: {
        "offset": _offset.toString(),
        "limit": _limit.toString(),
      },
    ).then((feedList) async {
      List<FeedModel> tempList = [];

      for (var feed in feedList) {
        if (feed.type != 'story') {
          if (feed.type == "reels" ||
              (feed.type == 'feed' && feed.images!.isNotEmpty)) {
            tempList.add(feed);
          }
        }
      }
      if (tempList.isEmpty) {
        _isMoreData = false;
      }

      _offset = _page * _limit;
      _page++;

      addDiscoverToDiscoverList(tempList);
    });
    notifyListeners();
  }

  void addDiscoverToDiscoverList(List<FeedModel> discovers) {
    discoverList.addAll(discovers);

    notifyListeners();
  }

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
