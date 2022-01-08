import 'package:flutter/material.dart';
import 'package:mini_project/httpServices/user_http_service.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:provider/provider.dart';

class FavoritedProducts extends ChangeNotifier {
  List<dynamic> _products = [];

  setProducts(List<dynamic> products) {
    _products = products;
    notifyListeners();
  }

  List<dynamic> getProducts() {
    return [..._products];
  }

  update(BuildContext context) async {
    await UserHttpService()
        .userFavoritesProducts(
            Provider.of<CurrentUserToken>(context).getToken())
        .then((newFavProducts) {
      Provider.of<FavoritedProducts>(context).setProducts(newFavProducts);
    });
  }
}
