import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/all_products_screen_item.dart';
import 'package:mini_project/components/my_products_sc_item.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/httpServices/sort_http_service.dart';
import 'package:mini_project/providers/favorited_products.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/searched_products.dart';
import 'package:mini_project/screens/add_product_sc.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'package:mini_project/models/product_model.dart';

//TODO style
class AllProductsSc extends StatefulWidget {
  //used when all products is accessed from fav tab on side screen
  static const route_from_fav = 'all-products-screen-fav';

  //used when all products is accessed from all products tab on side screen
  static const route_from_all = 'all-products-screen-aa';
  static const route_from_my = 'my-products-screen-aa';
  static const route_from_search = 'search-products';
  String appBarTitle;
  bool isFav = false;
  bool isAll = false;
  bool isMy = false;
  bool isSearch = false;

  AllProductsSc(
      {this.appBarTitle = "",
      this.isAll = false,
      this.isFav = false,
      this.isMy = false,
      this.isSearch = false});

  @override
  State<AllProductsSc> createState() => _AllProductsScState();
}

class _AllProductsScState extends State<AllProductsSc> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> products = widget.isSearch
        ? Provider.of<Searched>(context).getSearchedProducts()
        : widget.isFav
            ? Provider.of<FavoritedProducts>(context).getProducts()
            : Provider.of<Products>(context).getProducts();
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text(
              widget.appBarTitle,
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
            actions: widget.isMy?
                 ([
                    InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.add),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(AddProductSc.route);
                        })
                  ])
                : [
                    //list if widget in appbar actions
                    PopupMenuButton(
                      icon: Icon(Icons
                          .sort), //don't specify icon if you want 3 dot menu
                      color: mainColor,
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text(
                            "views",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      onSelected: (itemNum){_sort();},
                    ),
                  ],
          ),
          body: GridView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return widget.isMy
                  ? MyPrpductsScItem(products[index].id)
                  : ProductsScreenItem(
                      imageUrl: 'assets/test.jpeg',
                      name: products[index].name,
                      productID: products[index].id,
                    );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                mainAxisExtent: widget.isMy
                    ? MediaQuery.of(context).size.height * 0.15
                    : MediaQuery.of(context).size.height * 0.3,
                crossAxisSpacing: 5,
                crossAxisCount: widget.isMy ? 1 : 2),
          ),
        ),
        routes: {
          ProductDetails.route: (_) {
            return ProductDetails();
          }
        });
  }

  _sort() async {
     await SortHttpService().sortAsc('views').then((value) {
      Provider.of<Products>(context,listen: false).setProducts(value);
    });
  }
}
//Widget _showDropDownSortList() {}