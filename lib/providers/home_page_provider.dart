// ignore_for_file: unused_field

import 'dart:io';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  //POST
  List<FeedModel> feedsList = [];
  final int _limitFeed = 25;
  int _offsetFeed = 0;
  int _pageFeed = 0;

  bool _isMoreFeedData = false;
  get isMoreFeedData => _isMoreFeedData;

  void onRefreshFeed() {
    _offsetFeed = 0;
    _pageFeed = 0;
    _isMoreFeedData = false;
    feedsList.clear();
    getFeeds();
  }

  void getFeeds() async {
    await locator<SocialServices>().getAllFeedCall(queryParameters: {
      "offset": _offsetFeed.toString(),
      "limit": _limitFeed.toString(),
      "type": "feed"
    }).then((feedList) {
      List<FeedModel> tempList = [];
      for (var feed in feedList) {
        tempList.add(feed);
      }
      if (tempList.isEmpty) {
        _isMoreFeedData = false;
      } else {
        _isMoreFeedData = true;
      }
      _pageFeed++;

      _offsetFeed = _pageFeed * _limitFeed;
      addFeedToFeedList(tempList);
    });

    notifyListeners();
  }

  void addFeedToFeedList(List<FeedModel> feeds) {
    feedsList.addAll(feeds);

    notifyListeners();
  }

//REELS
  List<FeedModel> reelsList = [];

  final int _limitReels = 25;
  int _offsetReels = 0;
  int _pageReels = 0;
  bool _isMoreReelsData = false;

  get isMoreReelsData => _isMoreReelsData;
  void onRefreshReels() {
    _offsetReels = 0;
    _pageReels = 0;
    _isMoreReelsData = false;
    reelsList.clear();
    getReels();
  }

  void getReels() async {
    await locator<SocialServices>().getAllReelsCall(
      queryParameters: {
        "offset": _offsetReels.toString(),
        "limit": _limitReels.toString(),
        "type": "reels"
      },
    ).then((feedList) async {
      List<FeedModel> tempList = [];
      for (var feed in feedList) {
        tempList.add(feed);
      }
      if (tempList.isEmpty) {
        _isMoreReelsData = false;
      } else {
        _isMoreReelsData = true;
      }
      _pageReels++;

      _offsetReels = _pageReels * _limitReels;
      addReelsToReelsList(tempList);
    });

    notifyListeners();
  }

  void addReelsToReelsList(List<FeedModel> reels) {
    reelsList.addAll(reels);

    notifyListeners();
  }

  //STORY
  List<FeedModel> storyList = [];
  final int _limitStory = 50;
  int _offsetStory = 0;
  int _pageStory = 0;

  bool _isMoreStoryData = false;
  get isMoreStoryData => _isMoreFeedData;

  Future getStory() async {
    await locator<SocialServices>().getAllStoryCall(queryParameters: {
      "offset": _offsetStory.toString(),
      "limit": _limitStory.toString(),
      "type": "story"
    }).then((feedList) {
      List<FeedModel> tempList = [];
      for (var feed in feedList) {
        tempList.add(feed);
      }
      if (tempList.isEmpty) {
        _isMoreStoryData = false;
      } else {
        _isMoreStoryData = true;
      }
      _pageStory++;

      _offsetStory = _pageStory * _limitStory;
      addStoryToStoryList(tempList);
    });

    notifyListeners();
  }

  void addStoryToStoryList(List<FeedModel> feeds) {
    storyList.addAll(feeds);
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
