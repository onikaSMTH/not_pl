import 'package:flutter/material.dart';
class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridTile(child: Text('hi'),),
      color: Colors.black,
    );
  }
}
