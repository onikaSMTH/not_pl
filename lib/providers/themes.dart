import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;

  bool isDarkMode() => currentThemeMode == ThemeMode.dark;

  void toggleThemeMode(bool switchIsOn) {
    currentThemeMode = switchIsOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themes {
  static final darkTheme = ThemeData(
      backgroundColor: mainColor,
      scaffoldBackgroundColor: mainColor,
      primaryColor: backColor,
      iconTheme: const IconThemeData(
        color: backColor,
        opacity: 0.7,
      ));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: backColor,
      primaryColor: mainColor,
      backgroundColor: backColor,
      iconTheme: const IconThemeData(
        color: mainColor,
      ));
}
