import 'package:flutter/material.dart';

import '../colors.dart';
import '../screens/login_sc.dart';
class PopupDown extends StatelessWidget {
  String input;

  PopupDown(this.input);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LoginSignupSc.SignupRoute);
            },
            child: Text(
              'don\'t have an account ? Signup',
              style: TextStyle(
                  color: mainColor, fontSize: 18, fontWeight: FontWeight.bold),
            )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            color: niceColor),
      ),
    );
  }
}
