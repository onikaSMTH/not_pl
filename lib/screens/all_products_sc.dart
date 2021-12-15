import 'package:flutter/material.dart';
import 'package:mini_project/components/all_products_screen_item.dart';
import 'package:mini_project/data/products.dart';

//TODO style
class AllProductsSc extends StatelessWidget {
  //used when all products is accessed from fav tab on side screen
  static const route_from_fav = 'all-products-screen-fav';

  //used when all products is accessed from all products tab on side screen
  static const route_from_all = 'all-products-screen-aa';
  String appBarTitle;

  AllProductsSc(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductsScreenItem(
            imageUrl: 'assets/test.jpeg',
            name: products[index].name,
            product: products[index],
          );
        },
      ),
    ));
  }
}
