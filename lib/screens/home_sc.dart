import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/floating_search_bar.dart';
import 'package:mini_project/components/vertical_grid.dart';
import '../components/horizontal_grid.dart';
class HomeSc extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Container(color: backColor,
      child: Container(height: MediaQuery.of(context).size.height*0.8,
        child: ListView(
          children:[
HomeFloatingSearch(),
              ListTile(leading: Text('Popular',style: TextStyle(fontWeight: FontWeight.bold),),trailing: TextButton(onPressed: () {  },
              child: Text('Show all',style: TextStyle(color: mainColor),),),),
HorizontalGrid(),
              ListTile(leading: Text('Categories',style: TextStyle(fontWeight: FontWeight.bold),),trailing: TextButton(onPressed: () {  },
                child: Text('Show all',style: TextStyle(color: mainColor),),)),
              HorizontalGrid(),
            ListTile(leading: Text('Recently Added',style: TextStyle(fontWeight: FontWeight.bold),)),
              VerticalGrid(),
            ],
          ),
      ),
    );

  }
}