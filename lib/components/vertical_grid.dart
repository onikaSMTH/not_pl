import 'package:flutter/material.dart';
import 'package:mini_project/components/grid_item.dart';
import '../data/products.dart';

class VerticalGrid extends StatelessWidget {
  const VerticalGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.67,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 5,right: 5,bottom: 10),
            child: GridItem(
                image: products[index].image,
                price: products[index].price,
                title: products[index].name),
          );
        },
      ),
    );
  }
}
