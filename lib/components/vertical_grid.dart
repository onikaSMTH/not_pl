import 'package:flutter/material.dart';
import 'package:mini_project/components/grid_item.dart';
import 'package:mini_project/models/product_model.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class VerticalGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).getProducts();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.67,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: GridItem(
                id: products[index].id,
                image: products[index].image,
                price: products[index].price,
                title: products[index].name),
          );
        },
      ),
    );
  }
}
