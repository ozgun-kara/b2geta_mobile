import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';

class ExplorePageProvider with ChangeNotifier {
  List<FeedModel> exploreList = [];


  Future getExploreList() async {
  await locator<SocialServices>().getDiscover(
      queryParameters: {
        "offset":"0",
        "limit": "99",
      },
    ).then((feedList) async {


      for (var feed in feedList) {
        if (feed.type != 'story') {
          if ((feed.type == "reels") ||
              (feed.type == 'feed' && feed.images!.isNotEmpty)) {
            exploreList.add(feed);
          }
        }
      }

    });
    notifyListeners();
  }

}
