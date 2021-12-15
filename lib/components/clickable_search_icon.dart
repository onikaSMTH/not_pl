import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/screens/search_sc.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(SearchSc.route);
      },
      child: Container(
          margin: EdgeInsets.all(5),
          child: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
            size: 30,
          )),
    );
  }
}
