import 'package:flutter/material.dart';

import '../components/constants.dart';

ThemeData theme() {
  return ThemeData(
    // inputDecorationTheme: buildInputDecorationTheme(),
    appBarTheme: buildAppBarTheme(),
    fontFamily: "Muli",
    scaffoldBackgroundColor: Colors.white,
    textTheme: buildTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme buildTextTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme buildAppBarTheme() {
  return AppBarTheme(
      iconTheme: buildIconThemeData(),
      color: Colors.grey[300],
      textTheme: TextTheme(),
      elevation: 0,
      brightness: Brightness.light);
}

IconThemeData buildIconThemeData() {
  return IconThemeData(
    color: Colors.black,
  );
}

InputDecorationTheme buildInputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
    alignLabelWithHint: true,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}