import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData currentTheme;
  ThemeState({required this.currentTheme});
}

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.lightBlue,
  accentColor: Colors.white,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  accentColor: Colors.red,
  backgroundColor: Colors.grey,
  scaffoldBackgroundColor: Colors.grey,
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
);
