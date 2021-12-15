import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/clickable_search_icon.dart';
import 'package:mini_project/components/floating_search_bar.dart';
import 'package:mini_project/components/switch_theme_button.dart';
import '../data/nav-pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Nav extends StatefulWidget {
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 1;

  void selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? null
          : AppBar(
              actions: _currentIndex == 2 ? null : const [SearchIcon()],
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

        containerHeight: MediaQuery.of(context).size.height * 0.075,
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
                  Icon(Icons.local_mall, color: Theme.of(context).primaryColor),
              title: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(AppLocalizations.of(context)!.myProducts))),
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
