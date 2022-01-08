import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/httpServices/url.dart';
import 'package:mini_project/httpServices/user_http_service.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/single_product.dart';
import 'package:mini_project/providers/token_provider.dart';

import 'package:mini_project/screens/product_details_sc.dart';
import 'package:provider/provider.dart';

//grid item is used for both horizontal and vertical grids
class GridItem extends StatelessWidget {
  String title;
  double price;
  String image;
  int? id;
  bool ispopular;
  GridItem(
      {required this.price,
      required this.title,
      required this.image,
      required this.id,
      required this.ispopular});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _updateSingleProductProvider(context, id!);
          if (Provider.of<CurrentUserToken>(context, listen: false)
              .isUserLogedIn()) _isFavouritedByUser(context);
          Navigator.of(context).pushNamed(ProductDetails.route);
        },
        child: GridTile(
          child: Image.network(
              URL.image + "product_${Random().nextInt(3) + 1}.jpg")
          //Image.asset('assets/test.jpeg',fit: BoxFit.cover,)),
          ,
          footer: !ispopular?Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  color: mainColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: backColor),
                      ),
                    ],
                  )),
              //  Image.asset('assets/test.jpeg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width*0.5,height: MediaQuery.of(context).size.height*0.20,),
              Container(
                color: mainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon(CommunityMaterialIcons.heart,color: Colors.redAccent,),
                    Row(
                      children: [
                        Icon(
                          Icons.paid,
                          color: backColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          price.toString(),
                          style: TextStyle(color: backColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ):null,
        ));
  }

  Future<void> _updateSingleProductProvider(
      BuildContext context, int id) async {
    await HttpService().showProduct(id).then((value) {
      print(value);
      Provider.of<SingleProduct>(context, listen: false)
          .setProduct(context, value);
    });
  }
}

_isFavouritedByUser(BuildContext context) async {
  await UserHttpService()
      .userFavoritesProducts(
          Provider.of<CurrentUserToken>(context, listen: false).getToken())
      .then((value) {
    Provider.of<SingleProduct>(context, listen: false).setIsFav(value.contains(
        Provider.of<SingleProduct>(context, listen: false).getProduct()));
  });
}
