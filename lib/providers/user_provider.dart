import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/user_model.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get getUser => _user;

  updateUserModel(UserModel user) {
    _user = user;
    notifyListeners();
  }

  getProfile() async {
    await locator<MemberServices>().getProfileCall().then((value) {
      if (value != null) {
        updateUserModel(value);
      }
    });
    notifyListeners();
  }
}
