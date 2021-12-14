import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/side_screen_languages_item.dart';
import 'package:mini_project/components/side_screen_theme_mode_item.dart';
import 'package:mini_project/components/sidesc_item.dart';
import 'package:mini_project/screens/navigation_main_sc.dart';
import 'package:mini_project/screens/profile_sc.dart';
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
          route: ProfileSc.route,
          text: 'Profile',
          subtext: 'Edit Your Info'),
      SideScItem(
          icon: Icon(Icons.favorite, color: Colors.redAccent),
          route: '',
          text: 'Favourites',
          subtext: 'View your Favourite Items'),
     SideScLanguagesItem(),
      SideScreenMode(),
      SideScItem(
          icon: Icon(Icons.logout,color: Theme.of(context).primaryColor,),
          route: '',
          text: 'Logout',
          subtext: ''),
    ];
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor.withOpacity(0.8)),
      child: ListView.builder(
          padding: EdgeInsets.only(left: 5),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          }),
    ));
  }
}
