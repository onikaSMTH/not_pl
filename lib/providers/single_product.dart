import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_project/httpServices/comment_http_service.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/favorited_products.dart';
import 'package:provider/provider.dart';

class SingleProduct extends ChangeNotifier {
  Product _product = Product(
      id: null,
      name: '',
      contactInfo: '',
      expirationDate: '',
      image: "http://192.168.92.130:8000/storage/"+"product_${Random().nextInt(3)+1}.jpg",
      price: 0,
      quantity: 0);

  bool _isFav = false;
  List<dynamic> _categories = [];
  List<dynamic> _comments = [];

  setProduct(BuildContext context, Product product) {
    _product = product;
    _isFav = Provider.of<FavoritedProducts>(context, listen: false)
        .getProducts()
        .contains(product);
    updateCategories();
    updateComments();

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

  List<dynamic> getCategories() {
    return _categories;
  }

  List<dynamic> getComments() {
    return _comments;
  }

  updateCategories() async {
    await HttpService().getProductCategories(_product.id).then((value) {
      _categories = value;
      notifyListeners();
    });
  }

  updateComments() async {
    await CommentHttpService().getProductComments(_product.id).then((value) {
      _comments = value;
      notifyListeners();
    });
  }
}
