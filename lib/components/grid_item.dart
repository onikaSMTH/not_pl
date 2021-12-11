import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//grid item is used for both horizontal and vertical grids
class GridItem extends StatelessWidget {
  String title;
  double price;
  String image;

  GridItem({required this.price, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Image.network(
      image,
      fit: BoxFit.cover,
    ));
  }
}
