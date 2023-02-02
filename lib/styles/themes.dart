import 'package:flutter/material.dart';

class MyTheme {
  static Color lightBackground = const Color(0xfff1f23f);
  static Color darkBackground = const Color(0xff1f1e30);


  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        focusColor: lightBackground,
        hintColor: Colors.black,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        focusColor: darkBackground,
        hintColor: Colors.white,
      );
}
