import 'package:flutter/material.dart';
class CallSnackBar {


 CallSnackBar(BuildContext context , String msg){
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg),duration:Duration(seconds: 5),),
   );
 }
}



