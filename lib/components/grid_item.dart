import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/products.dart';
class GridItem extends StatelessWidget {

  String title;
  double price;
   String image;
  GridItem({required this.price,required this.title,required this.image});
  @override
  Widget build(BuildContext context) {
    return GridTile(
 child :Image.network(image,fit: BoxFit.cover,)

    );
  }
}
