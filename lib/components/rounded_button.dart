import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';

class RoundedButton extends StatelessWidget {
  String input;
  Function onTap;
  double width;
  double height;
  Color textColor;
  Color backColor;
  RoundedButton(this.input,this.onTap,this.width,this.height,this.textColor,this.backColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // TBD function received by constructor
      onTap: () {
        onTap(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * height,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(20)),
        child: Text(
          input,
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: textColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
