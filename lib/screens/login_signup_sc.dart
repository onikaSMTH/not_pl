import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/httpServices/user_http_service.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:mini_project/screens/nav_login_sc.dart';
import 'package:mini_project/screens/navigation_main_sc.dart';
import 'package:provider/provider.dart';
import '../components/rounded_button.dart';
import '../components/rounded_input.dart';
import '../components/popup_down.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//TODO waiting rounded button
class LoginSignupSc extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

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
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            left: boxWidth * 0.1,
            right: boxWidth * 0.05,
            top: boxHeight * 0.09),
        decoration: const BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.all(
            Radius.circular(42),
          ),
        ),
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height * 1
            : MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            SizedBox(
              height: boxHeight * 0.1,
            ),
            if (signup)
              RoundedInput(
                controller: fullnameController,
                icon: const Icon(
                  Icons.person,
                  color: mainColor,
                ),
                hint: AppLocalizations.of(context)!.fullName,
                isPassword: false,
              ),
            RoundedInput(
              controller: emailController,
              icon: const Icon(
                Icons.email,
                color: mainColor,
              ),
              hint: AppLocalizations.of(context)!.email,
              isPassword: false,
            ),

            RoundedInput(
              controller: passwordController,
              icon: const Icon(
                Icons.lock,
                color: mainColor,
              ),
              hint: AppLocalizations.of(context)!.password,
              isPassword: true,
            ),
            //confirm password field
            if (signup)
              RoundedInput(
                controller: confirmPasswordController,
                icon: const Icon(
                  Icons.lock,
                  color: mainColor,
                ),
                hint: AppLocalizations.of(context)!.confirmPassword,
                isPassword: true,
              ),
            SizedBox(
              height: boxHeight * 0.04,
            ),
            //login / signup button
            RoundedButton(
                signup
                    ? AppLocalizations.of(context)!.signup
                    : AppLocalizations.of(context)!.login,
                signup
                    ? () {
                        _registerUser(context);
                      }
                    : () {
                        _loginUser(context);
                      },
                0.5,
                0.07,
                backColor,
                mainColor)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      // preventing keyboard from pushing widgets app when it opens
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _buildBackground(context),
          _buildBox(context),
          //only show in sign in page
          if (!signup)
            PopupDown(AppLocalizations.of(context)!.dontHaveAnAccountSignUp)
        ],
      ),
    ));
    // routes: {
    //     LoginSignupSc.signUpRoute:(_)=>LoginSignupSc(signup: true),
    //     LoginSignupSc.signInRoute:(_)=>LoginSignupSc(signup: false),
    // },);
  }

  _registerUser(BuildContext context) {
    UserHttpService()
        .registerUser(fullnameController.text, emailController.text,
            passwordController.text, confirmPasswordController.text)
        .then((value) {
      // print(value[1]);
      // no need to sign in again

      _loginUser(context);
      Navigator.of(context).popUntil((route) => route == Nav.route);
      Navigator.of(context).pushNamed(Nav.route);
    });
  }

  _loginUser(BuildContext context) {
    UserHttpService()
        .loginUser(emailController.text, passwordController.text)
        .then((value) {
      Provider.of<CurrentUserToken>(context, listen: false).setToken(value[1]);
      Provider.of<CurrentUserToken>(context, listen: false).setUser(value[0]);
      Provider.of<CurrentUserToken>(context, listen: false).userLogedIn();
      Navigator.of(context).popUntil((route) => route == Nav.route);
      Navigator.of(context).pushNamed(Nav.route);
    });
  }
}
