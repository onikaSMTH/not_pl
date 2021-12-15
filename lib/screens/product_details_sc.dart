import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/product_details_headline_item.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
        centerTitle: true,
        backgroundColor: backColor,
        iconTheme: const IconThemeData(color: mainColor),
        title: const Text(
          'Product name',
          style: TextStyle(color: mainColor),
        ),
      ),
      body: Stack(
        children: [
          buildBackground(context),
          buildBackground1(context),
          ListView(
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
              //first row
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child:
                              DetailesScHeadline('Expires After', 'Equation')),
                      DetailesScHeadline('Description', description)
                    ]),
              ),
              //second row
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailesScHeadline(
                            'Available Quantity', quantity.toString()),
                        DetailesScHeadline('Categories', "categories")
                      ]))
            ],
          )
        ],
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.12,
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
                price.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ]),
            RoundedButton(
                'Contact The Seller', () {}, 0.5, 0.07, backColor, mainColor)
          ],
        ),
      ),
    );
  }
}
