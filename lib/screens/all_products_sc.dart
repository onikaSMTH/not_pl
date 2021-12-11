import 'package:flutter/material.dart';
import 'package:mini_project/components/all_products_screen_item.dart';
import 'package:mini_project/data/products.dart';

class AllProductsSc extends StatelessWidget {
  static const route = 'all-products-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductsScreenItem(
          imageUrl: 'assets/test.jpeg',
          name: products[index].name,
          product: products[index],
        );
      },
    ));
  }
}
