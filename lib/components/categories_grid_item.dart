import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:mini_project/colors.dart';

class CategoriesGridItem extends StatelessWidget {
  String name;
  CategoriesGridItem({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GridTile(
        child: Text(name,style: TextStyle(backgroundColor: backColor,color: mainColor),),
      )),
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    );
  }
}
