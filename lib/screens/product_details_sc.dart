import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/call_snack_bar.dart';
import 'package:mini_project/components/comments_view.dart';
import 'package:mini_project/components/product_details_headline_item.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/components/vertical_grid.dart';
import 'package:mini_project/httpServices/comment_http_service.dart';
import 'package:mini_project/httpServices/like_http_service.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/httpServices/user_http_service.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/favorited_products.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/single_product.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import '../screens/login_signup_sc.dart';

class ProductDetails extends StatelessWidget {
  TextEditingController commentController = TextEditingController();
  static const route = 'product-details';
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    // int id = ModalRoute.of(context)!.settings.arguments as int;
    Product product = Provider.of<SingleProduct>(context).getProduct();
    isFav = Provider.of<SingleProduct>(context).getIsFav();
    return Scaffold(
        appBar: AppBar(
         
          centerTitle: true,
          backgroundColor: backColor,
          iconTheme: const IconThemeData(color: mainColor),
          title: Text(
            product.name,
            style: TextStyle(color: mainColor),
          ),
        ),
        body: Stack(
          children: [
            buildBackground(context),
            buildBackground1(context),
          
            //image
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                child: Image.asset('assets/test.jpeg'),
                height: 170,
                width: 300,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35),
              child: ListView(
                children: [
                  //first row
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DetailesScHeadline('Expiration Date',
                                product.expirationDate.toString()),
                            DetailesScHeadline('Available Quantity',
                                product.quantity.toString())
                          ]),
                    ),
                  ),
                  //second row
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: DetailesScHeadline(
                          'Categories',
                          Provider.of<SingleProduct>(context)
                              .getCategories()
                              .map((e) {
                            return e.name.toString();
                          }).toString())),
                         
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          
                          children: [
                            Icon(Icons.remove_red_eye,color: mainColor,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(product.views.toString(),style: TextStyle(color: mainColor,fontSize: 16),),
                            )
                          ],
                        ),
                        GestureDetector(
                          child: Row(
                            children: [
                              Icon(CommunityMaterialIcons.comment,color: mainColor,),
                              Icon(
                          Icons.add,
                          size: 18,
                        )
                            ],
                          ),
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'new comment',
                                      style: TextStyle(color: mainColor),
                                    ),
                                    content: TextField(
                                      controller: commentController,
                                      decoration:
                                          InputDecoration(hintText: 'comment'),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("cancel",
                                              style:
                                                  TextStyle(color: mainColor))),
                                      TextButton(
                                        onPressed: () {
                                          _addComment(
                                              context, commentController.text);
                                        },
                                        child: Text(
                                          'add',
                                          style: TextStyle(color: mainColor),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                        
                      ],
                    ),
                  ),
                  CommentsView(),

                  //TODO list view for comments section
                ],
              ),
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
              RoundedButton('Contact The Seller', () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: backColor,
                    title: const Text(
                      'Contact Info',
                      style: TextStyle(color: mainColor),
                    ),
                    content: Text('Number : ${product.contactInfo} '),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          launchWhatsApp(product.id);
                        },
                        child: const Icon(
                          CommunityMaterialIcons.whatsapp,
                          color: Colors.green,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _launchCaller(product.id, context);
                        },
                        child: const Icon(
                          CommunityMaterialIcons.phone,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                );
              }, 0.5, 0.07, backColor, mainColor),
           
              Container(
                  child: Provider.of<CurrentUserToken>(context).isUserLogedIn()
                      ? GestureDetector(
                          onTap: () {
                            if (isFav)
                              _unlikeTheProduct(context, product.id);
                            else
                              _likeTheProduct(context, product.id);
                          },
                          child: isFav
                              ? Icon(Icons.favorite, color: Colors.redAccent)
                              : Icon(Icons.favorite_border))
                      : null)
            ],
          ),
        ));
  }
}

_launchCaller(int? number, BuildContext context) async {
  String url = "tel:${number}";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    CallSnackBar(context, ' couldn\'t launch number !');
  }
}

launchWhatsApp(int? number) async {
  final link = WhatsAppUnilink(
    phoneNumber: number.toString(),
  );
  // Convert the WhatsAppUnilink instance to a string.
  // Use either Dart's string interpolation or the toString() method.
  // The "launch" method is part of "url_launcher".
  await launch(link.toString());
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

_likeTheProduct(BuildContext context, int? prodcutID) async {
  await LikeHttpService()
      .addLike(Provider.of<CurrentUserToken>(context, listen: false).getToken(),
          prodcutID)
      .then((_) {
    Provider.of<SingleProduct>(context, listen: false).setIsFav(true);
    _updateFavoritedProducts(context);
  });
}

_unlikeTheProduct(BuildContext context, int? prodductID) async {
  await LikeHttpService()
      .removeLike(
          Provider.of<CurrentUserToken>(context, listen: false).getToken(),
          prodductID)
      .then((_) {
    Provider.of<SingleProduct>(context, listen: false).setIsFav(false);
    Provider.of<FavoritedProducts>(context, listen: false).update(context);
    _updateFavoritedProducts(context);
  });
}

_updateFavoritedProducts(BuildContext context) async {
  await UserHttpService()
      .userFavoritesProducts(
          Provider.of<CurrentUserToken>(context, listen: false).getToken())
      .then((favoritedProductrs) {
    Provider.of<FavoritedProducts>(context, listen: false)
        .setProducts(favoritedProductrs);
  });
}

_addComment(BuildContext context, String content) async {
  await CommentHttpService()
      .createComment(
          Provider.of<CurrentUserToken>(context, listen: false).getToken(),
          Provider.of<SingleProduct>(context, listen: false).getProduct().id,
          content)
      .then((_) {
    Provider.of<SingleProduct>(context,listen:false).updateComments();
  });
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
