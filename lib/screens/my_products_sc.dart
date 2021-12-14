import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/screens/login_signup_sc.dart';

class MyProductsSc extends StatelessWidget {
  const MyProductsSc({Key? key}) : super(key: key);

  onLogInTap(BuildContext context) {
    Navigator.of(context).pushNamed(LoginSignupSc.signInRoute);
  }

  onSignupTap(BuildContext context) {
    Navigator.of(context).pushNamed(LoginSignupSc.signUpRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

//TODO only if not signed in show this column
      child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       Padding(
      padding: EdgeInsets.only(top: 30, bottom: 80, left: 10),
      child: Text('Login/Signup Now To Publish Your Own Products!',
        style: TextStyle(

            fontWeight: FontWeight.bold, fontSize: 30, color: Theme.of(context).primaryColor),),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: RoundedButton('Login',onLogInTap,0.7,0.1,Theme.of(context).backgroundColor,Theme.of(context).primaryColor),)),
    Center(child: RoundedButton('Signup',onSignupTap,0.7,0.1,Theme.of(context).backgroundColor,Theme.of(context).primaryColor))
    ],
    ));
    }
}
