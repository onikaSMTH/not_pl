import 'package:flutter/material.dart';
import 'package:mini_project/models/product_model.dart';

class SingleProduct extends ChangeNotifier {
  Product _product = Product(
      name: '',
      contactInfo: '',
      expirationDate: '',
      image: null,
      price: 0,
      quantity: 0);

  bool _isFav = false;
  
  setProduct(Product product) {
    _product = product;
    notifyListeners();
  }

  Product getProduct() {
    return _product;
  }

  setIsFav(bool isFav) {
    _isFav = isFav;
    notifyListeners();
  }

  bool getIsFav() {
    return _isFav;
  }
}
