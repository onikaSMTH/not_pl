import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/models/product.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:provider/provider.dart';

class ProductsScreenItem extends StatelessWidget {
  String imageUrl;
  String name;
  String productID;


  ProductsScreenItem(
      {required this.imageUrl, required this.name,required this.productID});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: backColor2,
      child: InkWell(
        onTap: (){},
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color:mainColor,child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(ThemeProvider().isDarkMode().toString(),style: TextStyle(color: backColor),),
              ],
            )),
            Image.asset('assets/test.jpeg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width*0.5,height: MediaQuery.of(context).size.height*0.20,),
            Container(color:mainColor,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Icon(CommunityMaterialIcons.heart,color: Colors.redAccent,),
                Row(children: [Icon(Icons.paid,color: backColor,),SizedBox(width: 5,),Text('data',style: TextStyle(color: backColor),)],)
              ],),
            )
          ],
        ) ,
      ),
    );




  }
}

/*
onTap: () {
Navigator.of(context)
    .push(MaterialPageRoute(builder: (BuildContext context) {
return ProductDetails(quantity: product.quantity, imageUrl: product.image, name: product.name, price: product.price, description: product.description);
}));
},*/
