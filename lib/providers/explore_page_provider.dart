import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';

class ExplorePageProvider with ChangeNotifier {
  List<FeedModel> exploreList = [];
  final int _limit = 30;
  int _offset = 0;
  int _page = 0;
  bool _isMoreData = true;

  get isMoreData => _isMoreData;

  void getExploreList() async {
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
    exploreList.addAll(discovers);

    notifyListeners();
  }
}
