import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import '../components/rounded_button.dart';
import '../components/rounded_input.dart';
import '../components/popup_down.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//TODO waiting rounded button
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
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
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
          left: boxWidth * 0.1, right: boxWidth * 0.05, top: boxHeight * 0.09),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(
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
                icon: Icon(
                  Icons.person,
                  color: mainColor,
                ),
                hint: AppLocalizations.of(context)!.fullName),
          RoundedInput(
              icon: Icon(
                Icons.email,
                color: mainColor,
              ),
              hint: AppLocalizations.of(context)!.email),
          //TODO hide password + show eye
          RoundedInput(
              icon: Icon(
                Icons.lock,
                color: mainColor,
              ),
              hint: AppLocalizations.of(context)!.password),
          if (signup)
            RoundedInput(
              icon: Icon(
                Icons.lock,
                color: mainColor,
              ),
              hint: AppLocalizations.of(context)!.confirmPassword,
            ),
          SizedBox(
            height: boxHeight * 0.04,
          ),
          RoundedButton(
              signup
                  ? AppLocalizations.of(context)!.signup
                  : AppLocalizations.of(context)!.login,
              () {},
              0.5,
              0.07,
              Theme.of(context).backgroundColor,
              Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            _buildBackground(context),
            _buildBox(context),
            //only show in sign in page
            if (!signup) PopupDown('Don\'t Have An Account ? Signup')
          ],
        ),
      ),
    );
  }
}
