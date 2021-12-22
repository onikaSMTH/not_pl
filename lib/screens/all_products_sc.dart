import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/all_products_screen_item.dart';
import 'package:mini_project/components/my_products_sc_item.dart';
import 'package:mini_project/models/product.dart';
import 'package:mini_project/providers/products.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

//TODO style
class AllProductsSc extends StatelessWidget {
  //used when all products is accessed from fav tab on side screen
  static const route_from_fav = 'all-products-screen-fav';

  //used when all products is accessed from all products tab on side screen
  static const route_from_all = 'all-products-screen-aa';
  static const route_from_my = 'my-products-screen-aa';
  String appBarTitle;
  bool isFav=false;
  bool isAll=false;
  bool isMy=false;

  AllProductsSc({this.appBarTitle="",this.isAll=false,this.isFav=false,this.isMy=false});

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).getProducts();
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

      body: GridView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return isMy? MyPrpductsScItem(products[index].id):ProductsScreenItem(
            imageUrl: 'assets/test.jpeg',
            name: products[index].name,
            productID: products[index].id,
          );
        },

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          mainAxisExtent: isMy?MediaQuery.of(context).size.height*0.15:MediaQuery.of(context).size.height*0.3,

            crossAxisSpacing: 5, crossAxisCount: isMy? 1:2),
      ),
    ));
  }
}
