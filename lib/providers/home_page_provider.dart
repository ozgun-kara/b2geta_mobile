// ignore_for_file: unused_field, unused_local_variable

import 'dart:io';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  //POST
  List<FeedModel> feedsList = [];

  void getFeeds() async {
    await locator<SocialServices>().getAllFeedCall(queryParameters: {
      "offset":"0",
      "limit": "99",
      "type": "feed"
    }).then((feedList) {

      for (var feed in feedList) {
        feedsList.add(feed);
      }
    });

    notifyListeners();
  }



//REELS
  List<FeedModel> reelsList = [];



  void getReels() async {
    await locator<SocialServices>().getAllReelsCall(
      queryParameters: {
        "offset": "0",
        "limit": "99",
        "type": "reels"
      },
    ).then((feedList) async {

      for (var feed in feedList) {
        reelsList.add(feed);
      }

    });

    notifyListeners();
  }


  //STORY
  List<FeedModel> storyList = [];


  Future getStory() async {
    await locator<SocialServices>().getAllStoryCall(queryParameters: {
      "offset": '0',
      "limit": '99',
      "type": "story"
    }).then((feedList) {
      List<FeedModel> tempList = [];
      for (var feed in feedList) {
        storyList.add(feed);
      }
    });

    notifyListeners();
  }

  //CREATE POST/REELS
  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  late String uploadType = 'Post'; // POST, REELS
  int uploadStep = 0; // 0,1,2,3
  List<File>? imageFilesList = [];

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

  void updateSelectedImageFilesList(List<File> imgFilesList) {
    imageFilesList!.addAll(imgFilesList);
    notifyListeners();
  }

  void deleteSelectedImage(File image) {
    imageFilesList!.remove(image);
    notifyListeners();
  }

  void clearSelectedImageFilesList() {
    imageFilesList!.clear();
    notifyListeners();
  }
}
