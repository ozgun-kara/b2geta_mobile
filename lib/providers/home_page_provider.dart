import 'dart:io';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  late String uploadType; // Post, Reels
  int uploadStep = 0; // 0,1,2,3
  File? selectedImage;

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

  void updateSelectedImage(File newImage) {
    selectedImage = newImage;
    notifyListeners();
  }

  void deleteSelectedImage() {
    selectedImage = null;
    notifyListeners();
  }

}
