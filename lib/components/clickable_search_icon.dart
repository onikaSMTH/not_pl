import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/screens/search_sc.dart';
class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(SearchSc.route);
      },
      child: Icon(Icons.search,color: mainColor,),
    );
  }
}
