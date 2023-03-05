import 'package:b2geta_mobile/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get getUser => _user;

  updateUserModel(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
