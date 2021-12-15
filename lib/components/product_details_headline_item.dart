import 'package:auto_size_text/auto_size_text.dart';
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
              child: AutoSizeText(
                text,
                minFontSize: 17,
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: AutoSizeText(
                subText,minFontSize: 15,
                style: TextStyle(color: mainColor),
              )),
        ],
      ),
    );
  }
}
