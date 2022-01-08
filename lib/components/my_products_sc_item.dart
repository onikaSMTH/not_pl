import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/single_product.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:provider/provider.dart';

class MyPrpductsScItem extends StatelessWidget {
  int productID;
  MyPrpductsScItem(this.productID);
  Future<void> _updateSingleProductProvider(
      BuildContext context, int id) async {
    await HttpService().showProduct(id).then((value) {
      print(value);
      Provider.of<SingleProduct>(context, listen: false).setProduct(context,value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Products>(context)
        .getProducts()
        .firstWhere((element) => element.id == productID);
    return Container(
      color: mainColor,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Center(
        child: InkWell(
          // go to product details page
          onTap: () {
            _updateSingleProductProvider(context, productID);
            Navigator.pushNamed(context, ProductDetails.route,
                arguments: productID);
          },

          child: ListTile(
            //TODO Implement network image
            //leading: Image.asset(product.image),
            title: Text(
              product.name,
              style: TextStyle(color: backColor),
            ),
            trailing: TextButton(
              child: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {
                //call delete product here
              },
            ),
          ),
        ),
      ),
    );
  }
}
