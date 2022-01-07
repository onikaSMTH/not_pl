import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/single_product.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/models/product_model.dart';

class ProductsScreenItem extends StatelessWidget {
  String imageUrl;
  String name;
  int productID;

  ProductsScreenItem(
      {required this.imageUrl, required this.name, required this.productID});

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Products>(context)
        .getProducts()
        .firstWhere((element) => element.id == productID);
    return Container(
      margin: EdgeInsets.all(5),
      color: backColor2,
      child: InkWell(
        onTap: () {
          _updateSingleProductProvider(context, productID);
          Navigator.pushNamed(context, ProductDetails.route,
              arguments: productID);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: mainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.name,
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
                        product.price.toString(),
                        style: TextStyle(color: backColor),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _updateSingleProductProvider(
      BuildContext context, int id) async {
    await HttpService().showProduct(id).then((value) {
      print(value);
      Provider.of<SingleProduct>(context, listen: false).setProduct(value);
    });
  }
}

/*
onTap: () {
Navigator.of(context)
    .push(MaterialPageRoute(builder: (BuildContext context) {
return ProductDetails(quantity: product.quantity, imageUrl: product.image, name: product.name, price: product.price, description: product.description);
}));
},*/
