import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/clickable_search_icon.dart';
import 'package:mini_project/components/side_screen_languages_item.dart';
import 'package:mini_project/components/side_screen_theme_mode_item.dart';
import 'package:mini_project/components/sidesc_item.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:mini_project/screens/navigation_main_sc.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:mini_project/screens/profile_sc.dart';
import 'package:mini_project/screens/search_sc.dart';
import '../data/side_items.dart';

class SideSc extends StatelessWidget {
  static const route = 'Side-screen';


  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      SideScItem(
          icon: Icon(
            Icons.account_box,
            color: Theme.of(context).primaryColor,
          ),
          route: ProductDetails.route,
          text: 'Profile',
          subtext: 'Edit Your Info'),
      SideScItem(
          icon: Icon(Icons.favorite, color: Colors.redAccent),
          route: ProfileSc.route,
          text: 'Favourites',
          subtext: 'View your Favourite Items'),
     SideScLanguagesItem(),
      SideScreenMode(),
      SideScItem(icon: Icon(Icons.search,color: Theme.of(context).primaryColor,), route: SearchSc.route, text: 'Search', subtext: 'Search For Products'),
      SideScItem(
          icon: Icon(Icons.ballot,color: Theme.of(context).primaryColor,),
          route: AllProductsSc.route_from_all,
          text: 'All Products',
          subtext: 'View All Products'),
      //TODO only show if user have loged in
      SideScItem(
          icon: Icon(Icons.logout,color: Theme.of(context).primaryColor,),
          route: '',
          text: 'Logout',
          subtext: ''),
    ];
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ListView.builder(
      padding: EdgeInsets.only(left: 5),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return items[index];
      }),
    );
  }
}
