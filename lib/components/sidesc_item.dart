import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SideScItem extends StatelessWidget {
  Icon icon;
  String text;
  String subtext;
  String route;

  SideScItem(
      {required this.icon,
      required this.route,
      required this.text,
      required this.subtext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        alignment: Alignment.center,
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            subtext,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
