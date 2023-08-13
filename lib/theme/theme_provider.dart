import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeNotifier with ChangeNotifier {
  static Brightness defaultTheme =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  ThemeData _themeData =
      defaultTheme == Brightness.light ? lightTheme : darkTheme;
  ThemeData get themeData => _themeData;
  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  toggleTheme() {
    if (_themeData == darkTheme) {
      _themeData = lightTheme;
    } else {
      _themeData = darkTheme;
    }
    notifyListeners();
  }

  static ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
          background: Colors.black,
          primary: Colors.grey[900]!,
          secondary: Colors.grey[800]!));

  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)),
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
          background: Colors.grey[300]!,
          primary: Colors.grey[200]!,
          secondary: Colors.grey[300]!));
}
