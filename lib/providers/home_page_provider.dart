import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePageProvider with ChangeNotifier {
  List<FeedModel> feeds = [];
  List<FeedModel> reelsList = [];

  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  late String uploadType = 'Post'; // POST, REELS
  int uploadStep = 0; // 0,1,2,3
  List<XFile>? imageFilesList = [];

  void getFeeds() async {
    await locator<SocialServices>().getAllFeedCall(
        queryParameters: {"offset": "0", "limit": "25", "type": "feed"},
        userId: '').then((feedList) {
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

  void updateTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  void updateUploadType(String value) {
    uploadType = value;
    notifyListeners();
  }

  void updateUploadStep(int value) {
    uploadStep = value;
    notifyListeners();
  }

  void updateSelectedImageFilesList(List<XFile> imgFilesList) {
    imageFilesList!.addAll(imgFilesList);
    notifyListeners();
  }

  void deleteSelectedImage(XFile image) {
    imageFilesList!.remove(image);
    notifyListeners();
  }

  void clearSelectedImageFilesList() {
    imageFilesList!.clear();
    notifyListeners();
  }
}
