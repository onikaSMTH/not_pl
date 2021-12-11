import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/rounded_button.dart';

class ProfileSc extends StatelessWidget {
  const ProfileSc({Key? key}) : super(key: key);
  static const String route = 'profile-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Profile',
            style: TextStyle(color: mainColor),
          ),
        ),
        backgroundColor: backColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: MediaQuery.of(context).size.height * 0.2,
              color: mainColor,
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      initialValue: 'Full Name',
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      initialValue: 'Phone Number',
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      initialValue: 'Password',
                    )),
              ],
            )),
            ListTile(
              leading: Container(
                width: 200,
                child: Row(
                  children: [
                    Text('My Products'),
                    SizedBox(
                      width: 10,
                    ),
                    Text('15'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          Container(margin:EdgeInsets.only(left: 10),alignment:Alignment.bottomLeft,child: RoundedButton('change Password'))
          ],
        ),
      ),
    );
  }
}
