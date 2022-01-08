import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';

class RoundedInput extends StatefulWidget {
  Icon icon;
  String hint;
  bool isPassword;
  bool hidePassword = true;
  bool isEmail = false;
  bool isName = false;
  TextEditingController controller;

  RoundedInput(
      {required this.icon,
      required this.hint,
      required this.isPassword,
      required this.controller,
      required this.isEmail,
      required this.isName});

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  onEyeIconClicked() {
    setState(() {
      widget.hidePassword = !widget.hidePassword;
    });
  }

  String? get _errorText {
    final text = widget.controller.value.text;
    if (text.isEmpty) {
      return 'can\'t be empty';
    }
    if (text.length < 5) {
      return 'Too Short';
    }
    if (text.length > 20) {
      return 'too long';
    }
    if (widget.isEmail) {
      if (text.contains('\$') ||
          text.contains('_') ||
          text.indexOf('@') == -1 ||
          text.indexOf('.') == -1) {
    
        return 'invalid Email';
      } 
    }
    if (widget.isPassword) {
      if (!text.contains(RegExp('[0-9]'))) {
        return 'weak password';
      } 
    }
   
    return null;
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
        onChanged: (text) {
          setState(() {});
        },
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: widget.isPassword ? widget.hidePassword : false,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          errorText: _errorText,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: onEyeIconClicked,
                  child: Icon(
                    Icons.visibility,
                    color:
                        !widget.hidePassword ? Colors.redAccent : Colors.blue,
                  ))
              : null,
          //border: InputBorder.none,
          icon: widget.icon,
          labelText: widget.hint.toUpperCase(),
        ),
      ),
    );
  }
}
