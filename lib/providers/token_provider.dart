import 'package:flutter/material.dart';
import 'package:mini_project/models/user_model.dart';

class CurrentUserToken extends ChangeNotifier {

  static String _token = "";
  static User _user = User(name: 'name', email: 'email');
  static bool _is_user_loged_in = false;

  setToken(String token) {
    _token = token;
    notifyListeners();
  }

  String getToken() {
    return _token;
  }

  User getUser() {
    return _user;
  }

  setUser(User user) {
    _user = user;
    notifyListeners();
  }

  userLogedIn() {
    _is_user_loged_in=true;
    notifyListeners();
  }
  userLogedOut(){
    _is_user_loged_in=false;
    notifyListeners();
  }
  isUserLogedIn()=>_is_user_loged_in;
}