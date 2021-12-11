import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/screens/navigation_main_sc.dart';
import '../providers/side_items.dart';

class SideSc extends StatelessWidget {
  static const route = 'Side-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: mainColor.withOpacity(0.8)),
      child: ListView.builder(
          padding: EdgeInsets.only(left: 5),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          }),
    ));
  }
}
