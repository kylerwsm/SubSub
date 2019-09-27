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

  // iOS System Colors
  static Color lightSystemBlue = Color(0xff007aff);
  static Color lightSystemTeal = Color(0xff5ac8fa);
  static Color lightSystemGray5 = Color(0xffe5e5ea);
  static Color lightSystemGray6 = Color(0xfff2f2f7);

  static Color darkSystemBlue = Color(0xff0a84ff);
  static Color darkSystemTeal = Color(0xff64d2ff);
  static Color darkSystemGray5 = Color(0xffc2c2e);
  static Color darkSystemGray6 = Color(0xff1c1c1e);

  static ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color: lightSystemBlue),
    brightness: Brightness.light,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    buttonColor: lightSystemGray6,
    // primarySwatch: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      // color: Color(0xfff2f2f2),
      brightness: Brightness.light,
      elevation: 0.0,
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
    iconTheme: IconThemeData(color: darkSystemBlue),
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    buttonColor: darkSystemGray6,
    // primarySwatch: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      // color: Color(0xff1b1b1b),
      brightness: Brightness.dark,
      elevation: 0.0,
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
