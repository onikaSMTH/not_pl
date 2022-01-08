import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:provider/provider.dart';

class UserProducts extends ChangeNotifier {
  List<dynamic> _userProducts = [];

  setProducts(List<dynamic> products) {
    _userProducts = products;
    notifyListeners();
  }

  List<dynamic> getProducts() {
    return [..._userProducts];
  }

  Future<void> updateProducts(BuildContext context) async {
    await HttpService()
        .getUserProducts(Provider.of<CurrentUserToken>(context,listen: false
        ).getToken())
        .then((value) {
      _userProducts = value;
      notifyListeners();
    });
  }
}
