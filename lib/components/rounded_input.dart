import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';

class RoundedInput extends StatefulWidget {
  Icon icon;
  String hint;
bool isPassword;
bool hidePassword=false;
TextEditingController controller ;
  RoundedInput({required this.icon, required this.hint,required this.isPassword,required this.controller});

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  onEyeIconClicked(){
    setState(() {
      widget.hidePassword=!widget.hidePassword;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: niceColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: widget.hidePassword,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword?GestureDetector(
            onTap: onEyeIconClicked,
              child: Icon(Icons.visibility,color: widget.hidePassword? Colors.redAccent:Colors.blue,)):null,
          border: InputBorder.none,
          icon: widget.icon,
          labelText: widget.hint.toUpperCase(),
        ),
      ),
    );
  }
}
