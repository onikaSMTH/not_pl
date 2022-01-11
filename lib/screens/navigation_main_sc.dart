import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/clickable_search_icon.dart';
import 'package:mini_project/components/floating_search_bar.dart';
import 'package:mini_project/components/switch_theme_button.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:provider/provider.dart';
import '../data/nav-pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Nav extends StatefulWidget {
  static String route="nav - screen";
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 1;

  void selectPage(int index) {
    if(index==0&& Provider.of<CurrentUserToken>(context,listen: false).isUserLogedIn())index=3;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CurrentUserToken>(context).isUserLogedIn();
    return Scaffold(
      // preventing keyboard from pushing widgets app when it opens
      resizeToAvoidBottomInset: false,
      appBar: _currentIndex == 0 || _currentIndex==3
    ? null
          : AppBar(
              actions: _currentIndex == 2? null : const [SearchIcon()],
              backgroundColor: Theme.of(context).backgroundColor,
              title: Center(
                  child: Text(
                AppLocalizations.of(context)!.shop,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              )),
            ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        containerHeight:
            MediaQuery.of(context).orientation == Orientation.landscape
                ? MediaQuery.of(context).size.height * 0.125
                : MediaQuery.of(context).size.height * 0.075,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          selectPage(index);
        },
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: Theme.of(context).backgroundColor,
        items: [
          BottomNavyBarItem(
              activeColor: Theme.of(context).primaryColor.withOpacity(0.8),
              icon:
                  Icon(Icons.account_box, color: Theme.of(context).primaryColor),
              title: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Profile'))),
          BottomNavyBarItem(
              activeColor: Theme.of(context).primaryColor.withOpacity(0.8),
              icon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              title: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(AppLocalizations.of(context)!.home))),
          BottomNavyBarItem(
              activeColor: Theme.of(context).primaryColor.withOpacity(0.8),
              icon: Icon(
                Icons.view_agenda,
                color: Theme.of(context).primaryColor,
              ),
              title: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(AppLocalizations.of(context)!.menu))),

        ],
      ),
    );
  }
}
