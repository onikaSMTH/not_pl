import 'package:flutter/material.dart';
import 'package:mini_project/components/switch_theme_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SideScreenMode extends StatelessWidget {
  const SideScreenMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.dark_mode,color: Theme.of(context).primaryColor,),
      title: Text(AppLocalizations.of(context)!.darkMode,style: TextStyle(color: Theme.of(context).primaryColor),),
      trailing: ChangeThemeButtonWidget(),
    );
  }
}
