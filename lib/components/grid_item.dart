import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/models/dump_product.dart';
import 'package:mini_project/screens/product_details_sc.dart';

//grid item is used for both horizontal and vertical grids
class GridItem extends StatelessWidget {
  String title;
  double price;
  String image;
  int ? id;
  GridItem({required this.price, required this.title, required this.image,required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetails.route,arguments: id);
      },
      child: GridTile(

          child: Image.asset(
        'assets/test.jpeg',
        fit: BoxFit.cover,
      )),
    );
  }
}
