import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/grid_item.dart';
import '../data/products.dart';
class HorizontalGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      padding: EdgeInsets.only(left: 10),
      child: GridView.builder(
        padding: EdgeInsets.all(5),

        scrollDirection:Axis.horizontal ,
        itemCount: products.length, itemBuilder: (BuildContext context, int index) {
          return GridItem(price: products[index].price, title: products[index].name,image: products[index].image,);
      }, gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),

      ),
    );


  }
}
