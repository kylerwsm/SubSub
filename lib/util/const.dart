import 'package:flutter/material.dart';

class Constants {
  static String appName = "SubSub";

  // Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.orange;
  static Color darkAccent = Colors.orangeAccent;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;

  static ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color: darkBG),
    brightness: Brightness.light,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    // primarySwatch: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      color: Color(0xffe5e5e5),
      brightness: Brightness.light,
      elevation: 6.0,
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontFamily: 'Helvetica',
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    iconTheme: IconThemeData(color: lightBG),
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    // primarySwatch: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      color: Color(0xff1b1b1b),
      brightness: Brightness.dark,
      elevation: 6.0,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontFamily: 'Helvetica',
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
