import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      activeColor: Theme.of(context).primaryColor,
      activeTrackColor: Theme.of(context).primaryColor,
      inactiveThumbColor:Theme.of(context).primaryColor ,
      inactiveTrackColor:Colors.redAccent,


      value: themeProvider.isDarkMode(),
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleThemeMode(value);
      },
    );
  }
}