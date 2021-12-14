import 'package:mini_project/screens/product_details_sc.dart';
import 'package:mini_project/screens/profile_sc.dart';
import 'package:flutter/material.dart';
import '../components/sidesc_item.dart';
import 'package:flutter/material.dart';
//list of items in the menu List
List<SideScItem> items = [
  SideScItem(
      icon: Icon(
        Icons.account_box,
        color: Colors.white,
      ),
      route: ProfileSc.route,
      text: 'Profile',
      subtext: 'Edit Your Info'),
  SideScItem(
      icon: Icon(Icons.favorite, color: Colors.redAccent),
      route: '',
      text: 'Favourites',
      subtext: 'View your Favourite Items'),

  SideScItem(
      icon: Icon(Icons.logout),
      route: '',
      text: 'Logout',
      subtext: ''),
];
