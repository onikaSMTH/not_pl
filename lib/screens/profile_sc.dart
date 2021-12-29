import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/models/user_model.dart';
import 'package:mini_project/providers/products.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:mini_project/screens/edit_profile_sc.dart';
import 'package:provider/provider.dart';

class ProfileSc extends StatefulWidget {
  ProfileSc({Key? key}) : super(key: key);
  static const String route = 'profile-screen';
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  User user = User(name: 'name', email: 'email');
  int i = 0;
  @override
  State<ProfileSc> createState() => _ProfileScState();
}

class _ProfileScState extends State<ProfileSc> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //TODO do it better
    widget.user = Provider.of<CurrentUserToken>(context).getUser();
    widget.emailController.text = widget.user.email;
    widget.fullnameController.text = widget.user.name;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProfileSc.route);
              },
              child: Icon(
                Icons.edit,
                color: mainColor,
              ))
        ],
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        title: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            AppLocalizations.of(context)!.profile,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Icon(
              Icons.person,
              size: MediaQuery.of(context).size.height * 0.2,
              color: Theme.of(context).primaryColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: TextField(
                      readOnly: true,
                      controller: widget.fullnameController,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          label: Text(AppLocalizations.of(context)!.fullName)),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: TextField(
                      readOnly: true,
                      controller: widget.emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          label: Text('email')),
                    )),
              ],
            ),
            //clickable my products button with number of products
            ListTile(
              leading: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
                onPressed: () {
                  Navigator.of(context).pushNamed(AllProductsSc.route_from_my);
                },
                child: SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context)!.myProducts),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(Products().getProducts().length.toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
    
    );
  }
}
