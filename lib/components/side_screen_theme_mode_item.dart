import 'package:flutter/material.dart';
import 'package:mini_project/components/switch_theme_button.dart';
class SideScreenMode extends StatelessWidget {
  const SideScreenMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.dark_mode,color: Theme.of(context).primaryColor,),
      title: Text('Dark Mode',style: TextStyle(color: Theme.of(context).primaryColor),),
      trailing: ChangeThemeButtonWidget(),
    );
  }
}
