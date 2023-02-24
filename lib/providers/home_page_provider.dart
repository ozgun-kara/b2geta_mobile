import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePageProvider with ChangeNotifier {
  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  late String uploadType; // Post, Reels
  int uploadStep = 0; // 0,1,2,3

  // File? selectedImage;

  List<XFile>? imageFilesList;

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

  // void updateSelectedImage(File newImage) {
  //   selectedImage = newImage;
  //   notifyListeners();
  // }
  //
  // void deleteSelectedImage() {
  //   selectedImage = null;
  //   notifyListeners();
  // }

  void updateSelectedImageFilesList(List<XFile> imgFilesList) {
    imageFilesList = imgFilesList;
    notifyListeners();
  }

void deleteSelectedImage(XFile image) {
  imageFilesList!.remove(image);
  notifyListeners();
}
}
