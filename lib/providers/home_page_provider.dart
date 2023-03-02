import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePageProvider with ChangeNotifier {
  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  late String uploadType = 'Post'; // POST, REELS
  int uploadStep = 0; // 0,1,2,3
  List<XFile>? imageFilesList = [];

  XFile? reelsFile;

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

  void updateSelectedReelsFile(XFile reelsFile) {
    reelsFile = reelsFile;
    notifyListeners();
  }
}
