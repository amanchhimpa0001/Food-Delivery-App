import 'package:flutter/foundation.dart';
import 'package:food_delivery_new_project/model/user_model.dart';

class All_controllers extends ChangeNotifier {
  dynamic _usermodel;
  UserModel get getusermodel => _usermodel;
  setuser(UserModel modeldata) {
    _usermodel = modeldata;
    notifyListeners();
  }
}
