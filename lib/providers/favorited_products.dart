import 'package:flutter/material.dart';
import 'package:mini_project/models/product_model.dart';

class FavoritedProducts extends ChangeNotifier {
  List<dynamic> _products = [];

  setProducts(List<dynamic> products) {
    _products = products;
    notifyListeners();
  }

  List<dynamic> getProducts() {
    return _products;
  }
}
