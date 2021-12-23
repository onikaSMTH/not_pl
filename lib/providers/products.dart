import 'package:flutter/cupertino.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:http/http.dart' as http;

class Products extends ChangeNotifier {
  List<dynamic> listProducts = [
    Product(
        id: 1,
        quantity: 1,
        price: 100,
        name: 'product 1',
        image: 'assets/test.jpeg',
        expirationDate: '',
        contactInfo: ''),
    Product(
        id: 2,
        quantity: 2,
        price: 200,
        name: 'product 2',
        image: 'assets/test.jpeg',
        contactInfo: '',
        expirationDate: ''),
    Product(
        id: 3,
        quantity: 3,
        price: 300,
        name: 'product 3',
        image: 'assets/test.jpeg',
        expirationDate: '',
        contactInfo: ''),
    Product(
        id: 4,
        quantity: 4,
        price: 400,
        name: 'product 4',
        image: 'assets/test.jpeg',
        expirationDate: '',
        contactInfo: ''),
    Product(
        id: 5,
        quantity: 5,
        price: 500,
        name: 'product 5',
        image: 'assets/test.jpeg',
        contactInfo: '',
        expirationDate: ''),
    Product(
        id: 6,
        quantity: 6,
        price: 600,
        name: 'product 6',
        image: 'assets/test.jpeg',
        expirationDate: '',
        contactInfo: ''),
    Product(
      id: 7,
      quantity: 7,
      price: 700,
      name: 'product 7',
      image: 'assets/test.jpeg',
      contactInfo: '',
      expirationDate: '',
    ),
  ];
  List<Product> getProducts() {
    return [...listProducts];
  }

  void deleteProduct(Product product) {
    listProducts.removeWhere((element) => element.id == product.id);
    notifyListeners();
  }

  void database() {
    var url = Uri.parse("http://192.168.7.130:8000/products");

    listProducts = http.get(url) as List<Product>;
    notifyListeners();
  }

  void updateProduct(Product product) {
    int index = listProducts.indexWhere((element) => element.id == product.id);
    listProducts[index] = product;
    notifyListeners();
  }

  void addProduct(Product product) {
    listProducts.add(product);
    notifyListeners();
  }

  void setProducts(List<dynamic> a) {
    listProducts = a;
  }


}
