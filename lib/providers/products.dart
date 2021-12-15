import 'package:flutter/cupertino.dart';
import 'package:mini_project/models/product.dart';

class Products extends ChangeNotifier {

   List<Product> getProducts(){
    return [...listProducts];
  }
  void deleteProduct(Product product) {
    listProducts.removeWhere((element) => element.id == product.id);
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

  List<Product> listProducts = [
    Product(
        id: '1',
        description: 'this is product 1',
        quantity: 1,
        price: 100,
        name: 'product 1',
        image: 'assets/test.jpeg'),
    Product(
        id: '2',
        description: 'this is product 2',
        quantity: 2,
        price: 200,
        name: 'product 2',
        image: 'assets/test.jpeg'),
    Product(
        id: '3',
        description: 'this is product 3',
        quantity: 3,
        price: 300,
        name: 'product 3',
        image: 'assets/test.jpeg'),
    Product(
        id: '4',
        description: 'this is product 4',
        quantity: 4,
        price: 400,
        name: 'product 4',
        image: 'assets/test.jpeg'),
    Product(
        id: '5',
        description: 'this is product 5',
        quantity: 5,
        price: 500,
        name: 'product 5',
        image: 'assets/test.jpeg'),
    Product(
        id: '6',
        description: 'this is product 6',
        quantity: 6,
        price: 600,
        name: 'product 6',
        image: 'assets/test.jpeg'),
    Product(
      id: '7',
      description: 'this is product 7',
      quantity: 7,
      price: 700,
      name: 'product 7',
      image: 'assets/test.jpeg',
    ),
  ];
}
