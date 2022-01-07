import 'package:flutter/material.dart';

class Searched extends ChangeNotifier {
  List<dynamic> searchedProducts = [];

  void setSearchedProducts(List<dynamic> list) {
    searchedProducts = list;
    notifyListeners();
  }

  List<dynamic> getSearchedProducts() {
    return searchedProducts;
  }
}
