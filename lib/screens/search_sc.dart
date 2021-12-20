import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/components/call_snack_bar.dart';
import 'package:mini_project/components/rounded_button.dart';

import '../colors.dart';

//TODO create on/off buttons & show suggestions
class SearchSc extends StatelessWidget {
  static const route = 'search-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: TextField(
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Icon(Icons.insert_invitation,color: Theme.of(context).primaryColor,),
              onTap: () {
                showDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2022),
                    context: context).then((value) => null);
              },
            ),
            border: InputBorder.none,
            hintText: 'Search For Products',
            hintStyle: TextStyle(color : Theme.of(context).primaryColor.withAlpha(90)),
          ),
        ),

        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
                'input',
                () {},
                0.3,
                0.05,
                Theme.of(context).backgroundColor,
                Theme.of(context).primaryColor),
            RoundedButton(
                'input',
                () {},
                0.3,
                0.05,
                Theme.of(context).backgroundColor,
                Theme.of(context).primaryColor),
            RoundedButton(
                'input',
                () {},
                0.3,
                0.05,
                Theme.of(context).backgroundColor,
                Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
