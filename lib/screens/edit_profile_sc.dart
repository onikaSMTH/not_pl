import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mini_project/components/call_snack_bar.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/httpServices/user_http_service.dart';
import 'package:mini_project/models/user_model.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class EditProfileSc extends StatefulWidget {
  const EditProfileSc({Key? key}) : super(key: key);
  static String route = 'edit-profile-screen';

  @override
  State<EditProfileSc> createState() => _EditProfileScState();
}

class _EditProfileScState extends State<EditProfileSc> {
  TextEditingController fullnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((_) {
      User user = CurrentUserToken().getUser();
      setState(() {
             fullnameController.text = user.name;
      emailController.text = user.email;
      });
 
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    controller: fullnameController,
                    decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        label: Text(AppLocalizations.of(context)!.fullName)),
                  )),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        label: Text('email')),
                  )),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    controller: newPasswordController,
                    decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        label: Text('new Password')),
                  )),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    controller: confirmNewPasswordController,
                    decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        label: Text('confirm new Password')),
                  )),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  _changePassword(context);
                },
                child: Text(
                  'save',
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).backgroundColor),
                ))
          ],
        ),
      ),
    ));
  }

  _changePassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Change Password')),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: currentPasswordController,
                      decoration: InputDecoration(
                        label: Text('current password'),
                        labelStyle: TextStyle(color: mainColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _onCancel(context);
                  },
                  child: Text('cancel')),
              TextButton(
                  onPressed: () {
                    _onConfirm(context);
                  },
                  child: Text('confirm')),
            ],
          );
        });
  }

  _onConfirm(BuildContext context) async {
    await UserHttpService()
        .loginUser(
            Provider.of<CurrentUserToken>(context, listen: false)
                .getUser()
                .email,
            currentPasswordController.text)
        .then((value) async {
    await  UserHttpService()
          .updateUser(
              Provider.of<CurrentUserToken>(context, listen: false).getToken(),
              fullnameController.text,
              emailController.text,
              newPasswordController.text,
              confirmNewPasswordController.text)
          .then((value) {
        Provider.of<CurrentUserToken>(context, listen: false).setUser(
            User(name: fullnameController.text, email: emailController.text));
        CallSnackBar(context, value.toString());
        Navigator.of(context).pop();
      });
    });
  }

  _onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
