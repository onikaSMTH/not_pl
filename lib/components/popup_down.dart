import 'package:flutter/material.dart';
import '../colors.dart';
import '../screens/login_signup_sc.dart';

//component used in the signup screen (clickable text)
class PopupDown extends StatelessWidget {
  final String input;

  PopupDown(this.input);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        child: InkWell(
            onTap: () {
               Navigator.of(context).pushNamed(LoginSignupSc.signUpRoute);
            },
            child:  Text(
              input,
              style: TextStyle(
                  color: mainColor, fontSize: 18, fontWeight: FontWeight.bold),
            )),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            color: niceColor),
      ),
    );
  }
}
