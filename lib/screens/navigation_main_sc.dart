import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/screens/sidesc.dart';
import 'login_sc.dart';
import '../data/nav-pages.dart';
class Nav extends StatefulWidget {
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex=1;

  void selectPage(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  backgroundColor: backColor,
  title: Center(child: Text('Shop',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: mainColor),)),
),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(containerHeight: MediaQuery.of(context).size.height*0.085,
          selectedIndex: _currentIndex,
          onItemSelected: (index){
selectPage(index);

          },
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          backgroundColor: backColor,
          items: [
            BottomNavyBarItem(activeColor:mainColor.withOpacity(0.8),icon: Icon(Icons.directions_walk,color:mainColor), title: Text('Login')),
            BottomNavyBarItem(activeColor:mainColor.withOpacity(0.8),icon: Icon(Icons.home,color: mainColor,), title: Text('Home')),
            BottomNavyBarItem(activeColor:mainColor.withOpacity(0.8),icon: Icon(Icons.view_agenda,color: mainColor,), title: Text('Menu')),
          ],
        ),
    );
    
  }
}