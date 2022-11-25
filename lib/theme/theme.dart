import 'package:flutter/material.dart';

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
  );
}

ThemeData _buildDarkTheme() {
  return ThemeData(
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.lightBlue,
      tertiary: Colors.lightBlueAccent,
      outline: Colors.blueAccent,
    ),
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: Colors.blue,
    // ).copyWith(
    //   brightness: Brightness.dark,
    // ),
  );
}