import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/models/product.dart';
import 'package:mini_project/providers/products.dart';
import 'package:provider/provider.dart';
class MyPrpductsScItem extends StatelessWidget {
String productID;
MyPrpductsScItem(this.productID);
  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Products>(context).getProducts().where((element) => element.id==productID).toList()[0];
    return Container(color: mainColor,
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      child: Center(
        child: InkWell(

          child: ListTile(
            leading: Image.asset(product.image),
            title: Text(product.name,style: TextStyle(color: backColor),),
            trailing: TextButton(
                child: Icon(Icons.delete,color: Colors.redAccent,),
             onPressed: () {
                  //call delete product here
             },),

          ),
        ),
      ),
    );
  }
}
