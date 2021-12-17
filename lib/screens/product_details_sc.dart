import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/product_details_headline_item.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/models/product.dart';
import 'package:mini_project/providers/products.dart';
import 'package:provider/provider.dart';
import '../screens/login_signup_sc.dart';

class ProductDetails extends StatelessWidget {
  static const route = 'product-details';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    Product product = Provider.of<Products>(context)
        .getProducts()
        .firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
        centerTitle: true,
        backgroundColor: backColor,
        iconTheme: const IconThemeData(color: mainColor),
        title: Text(
          product.name,
          style: TextStyle(color: mainColor),
        ),
      ),
      body:  Stack(
          children: [
            buildBackground(context),
            buildBackground1(context),
            //image
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                child: Image.asset(product.image),
                height: 170,
                width: 300,
              ),
            ),
            ListView(
              children: [
                //first row
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.50),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              child: DetailesScHeadline(
                                  'Expires After', 'Equation')),
                          DetailesScHeadline('Description', product.description)
                        ]),
                  ),
                ),
                //second row
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DetailesScHeadline(
                              'Available Quantity', product.quantity.toString()),
                          DetailesScHeadline('Categories', "categories")
                        ])),
                Divider(),
                Center(child: Text('Comments',style:TextStyle(color: mainColor)),),
                Divider(height: 150,),
                //TODO list view for comments section
              ],
            )
          ],
        ),

      //bottom
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        color: backColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(children: [
              Icon(
                Icons.attach_money,
                size: 15,
              ),
              Text(
                product.price.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ]),
            RoundedButton(
                'Contact The Seller', () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: backColor,
                  title: const Text('Contact Info',style: TextStyle(color: mainColor),),
                  content:  Text('Number : ${product.id} '),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {},
                      //TODO open in whatsapp
                      child: const Icon(CommunityMaterialIcons.whatsapp,color: Colors.green,),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(CommunityMaterialIcons.facebook_messenger,color: Colors.blue,) ,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(CommunityMaterialIcons.phone,color: mainColor,) ,
                    ),
                  ],
                ),
              );
            }, 0.5, 0.07, backColor, mainColor)
          ],
        ),

    ));
  }
}


Widget buildBackground1(context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.47,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
    ),
  );
}

Widget buildBackground(context) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
    ),
  );
}
