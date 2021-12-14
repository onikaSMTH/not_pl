import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/main.dart';
import '../screens/login_signup_sc.dart';

class ProductDetails extends StatelessWidget {
  static const route = 'product-details';
  String imageUrl;
  double price;
  String description;
  String name;
  int quantity;

  ProductDetails(
      {required this.quantity,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.description});

  Widget buildBackground1(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.47,
        width: double.infinity,
        decoration:  BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
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
        decoration:  BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
        centerTitle: true,
        backgroundColor: backColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          'Product name',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Stack(
        children: [
          buildBackground(context),
          buildBackground1(context),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //image
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  child: SizedBox(
                    child: Image.asset(imageUrl),
                    height: 170,
                    width: 300,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 50),
                  child: Text('Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(description,
                      style:  TextStyle(
                          fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 5),
                  child: Text('Available Quantinty',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(quantity.toString(),
                      style:  TextStyle(
                          fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 15),
                  child:  Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  ),
                  padding: const EdgeInsets.all(0),
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(children: [
              Icon(
                Icons.attach_money,
                size: 15,
              ),
              Text(
                price.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ]),
            RoundedButton('Contact The Seller',(){},0.5,0.07,Theme.of(context).backgroundColor,Theme.of(context).primaryColor)
          ],
        ),
      ),
    );
  }
}
