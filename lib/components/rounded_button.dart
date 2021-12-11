import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
class RoundedButton extends StatelessWidget {
String input;
RoundedButton(this.input);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*0.5,
        height: MediaQuery.of(context).size.height*0.07,
        decoration: BoxDecoration(color: mainColor,borderRadius: BorderRadius.circular(20)),
        child: Text(input,textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,),),
      ),
    );
  }
}
