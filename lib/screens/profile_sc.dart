import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/data/products.dart';

class ProfileSc extends StatelessWidget {
  const ProfileSc({Key? key}) : super(key: key);
  static const String route = 'profile-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:  IconThemeData(color: Theme.of(context).iconTheme.color),
        title:  Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Profile',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: MediaQuery.of(context).size.height * 0.2,
              color: Theme.of(context).primaryColor,
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      initialValue: 'Full Name',
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      initialValue: 'Phone Number',
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      initialValue: 'Password',
                    )),
              ],
            )),
            //clickable my products button with number of products
            ListTile(
              leading: SizedBox(
                width: 200,
                child: Row(
                  children: [
                    const Text('My Products'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(products.length.toString()),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.bottomLeft,
                child: RoundedButton('change Password',(){},0.5,0.07,Theme.of(context).backgroundColor,Theme.of(context).primaryColor))
          ],
        ),
      ),
    );
  }
}
