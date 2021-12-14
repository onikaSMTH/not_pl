import 'package:flutter/material.dart';
import 'package:mini_project/models/product.dart';
import 'package:mini_project/screens/product_details_sc.dart';

class ProductsScreenItem extends StatelessWidget {
  String imageUrl;
  String name;

  //to be deleted later
  Product product;

//TODO setup provider
  ProductsScreenItem(
      {required this.imageUrl, required this.name, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO HARD list tile back color is fucked up
        ListTile(
          enabled: false,
          tileColor: Theme.of(context).backgroundColor,
          leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Image.asset(imageUrl)),
          title: Text(
            name,
            textAlign: TextAlign.left,
            style:
                TextStyle(backgroundColor: Theme.of(context).backgroundColor),
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        )
      ],
    );
    ;
  }
}

/*
onTap: () {
Navigator.of(context)
    .push(MaterialPageRoute(builder: (BuildContext context) {
return ProductDetails(quantity: product.quantity, imageUrl: product.image, name: product.name, price: product.price, description: product.description);
}));
},*/
