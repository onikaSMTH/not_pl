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
    return Container(
      alignment: Alignment.center,
      child: ListTile(
        onTap: (){Navigator.of(context).pushNamed(route);},
        leading: icon,
        title: Text(
          text,
          style:  TextStyle(color: Theme.of(context).primaryColor),
        ),
        subtitle: Text(
          subtext,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
