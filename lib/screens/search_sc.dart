import 'package:flutter/material.dart';
import 'package:mini_project/components/rounded_button.dart';

import '../colors.dart';
//TODO hide down line & create on/off buttons & show suggestions
class SearchSc extends StatelessWidget {
  static const route='search-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: TextField(decoration: InputDecoration(hintText: 'Search For Products'),),
        actions: [Icon(Icons.cancel,color: Theme.of(context).primaryColor,)],
  iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton('input', (){}, 0.3, 0.05,Theme.of(context).backgroundColor,Theme.of(context).primaryColor),
            RoundedButton('input', (){}, 0.3, 0.05,Theme.of(context).backgroundColor,Theme.of(context).primaryColor),
            RoundedButton('input', (){}, 0.3, 0.05,Theme.of(context).backgroundColor,Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
