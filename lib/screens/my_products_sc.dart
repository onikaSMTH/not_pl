import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/screens/login_signup_sc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RoundedButton(
                  AppLocalizations.of(context)!.login,
                  onLogInTap,
                  0.7,
                  0.1,
                  Theme.of(context).backgroundColor,
                  Theme.of(context).primaryColor),
            )),
        Center(
            child: RoundedButton(
                AppLocalizations.of(context)!.signup,
                onSignupTap,
                0.7,
                0.1,
                Theme.of(context).backgroundColor,
                Theme.of(context).primaryColor))
      ],
    ));
  }
}
