import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';

class RoundedInput extends StatelessWidget {
  Icon icon;
  String hint;

  RoundedInput({required this.icon, required this.hint});

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
        keyboardType: TextInputType.emailAddress,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: icon,
          hintText: hint,
          labelText: hint.toUpperCase(),
        ),
      ),
    );
  }
}
