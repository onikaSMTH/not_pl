import 'package:flutter/material.dart';
import 'package:mini_project/components/categories_grid_item.dart';
import 'package:mini_project/components/grid_item.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/categories_provider.dart';
import 'package:mini_project/screens/profile_sc.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class HorizontalGrid extends StatelessWidget {
  bool isPopular;
  bool isCategory;
  List<dynamic> products=[];
  HorizontalGrid({this.isCategory=false,this.isPopular=false});

  @override
  Widget build(BuildContext context) {

   products=isPopular?Provider.of<Products>(context).getProducts():Provider.of<Categories>(context).getCategories();
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.only(left: 10),
      child: GridView.builder(
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            child: isPopular?GridItem(ispopular: true,
              id: products[index].id,
              price: products[index].price,
              title: products[index].name,
              image: products[index].image,
            ):CategoriesGridItem( name: products[index].name.toString(),),
          );
        },
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100),
      ),
    );
  }
}
