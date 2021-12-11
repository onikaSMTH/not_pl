import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import '../components/rounded_button.dart';
import '../components/rounded_input.dart';
import '../components/popup_down.dart';

class LoginSignupSc extends StatelessWidget {
  //this bool is used to determine wither or not the screen need to be rendered as
  //signup screen , if so new items will be added to the signing screen
  bool signup = false;
  static const String signInRoute = 'sign-in';
  static const String signUpRoute = 'sign-up';

  LoginSignupSc({required this.signup});

  Widget _buildBackground(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(300),
        ),
      ),
    );
  }
//main box overlays
  Widget _buildBox(BuildContext context) {
    var boxHeight = MediaQuery.of(context).size.height;
    var boxWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          left: boxWidth * 0.1, right: boxWidth * 0.1, top: boxHeight * 0.05),
      decoration: const BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.all(
          Radius.circular(42),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: boxHeight * 0.1,
          ),
          if (signup)
            RoundedInput(
                icon: const Icon(
                  Icons.person,
                  color: mainColor,
                ),
                hint: 'Full name'),
          RoundedInput(
              icon: const Icon(
                Icons.email,
                color: mainColor,
              ),
              hint: 'Email'),
          RoundedInput(
              icon: const Icon(
                Icons.lock,
                color: mainColor,
              ),
              hint: 'Password'),
          if (signup)
            RoundedInput(
              icon: const Icon(
                Icons.lock,
                color: mainColor,
              ),
              hint: 'Confirm Password',
            ),
          SizedBox(
            height: boxHeight * 0.04,
          ),
          RoundedButton(signup ? 'Signup' : 'Login')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _buildBackground(context),
          _buildBox(context),
          //only show in sign in page
          if (!signup) PopupDown('Don\'t Have An Account ? Signup')
        ],
      ),
    );
  }
}
