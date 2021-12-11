import 'package:flutter/material.dart';
import 'package:mini_project/components/grid_item.dart';
import '../data/products.dart';

class VerticalGrid extends StatelessWidget {
  const VerticalGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: MediaQuery.of(context).size.height*0.67,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GridItem(image:products[index].image,price: products[index].price, title: products[index].name);
        },
      ),
    );
  }
}