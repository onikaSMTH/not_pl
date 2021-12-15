import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  const HomeSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: InkWell(
        child: ListTile(
          leading: Icon(Icons.search),
          title: Text('Search For Products'),
        ),
      ),
    );
  }
}
