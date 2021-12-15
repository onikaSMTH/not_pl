import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';

class DetailesScHeadline extends StatelessWidget {
  String text;
  String subText;

  DetailesScHeadline(this.text, this.subText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                text,
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                subText,
                style: TextStyle(color: mainColor),
              )),
        ],
      ),
    );
  }
}
