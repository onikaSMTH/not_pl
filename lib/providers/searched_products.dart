import 'package:flutter/material.dart';

class Searched extends ChangeNotifier {
  List<dynamic> _searchedProducts = [];

  void setSearchedProducts(List<dynamic> list) {
    _searchedProducts = list;
    notifyListeners();
  }

  List<dynamic> getSearchedProducts() {
    return [..._searchedProducts];
  }
}
