import 'package:flutter/material.dart';
import 'package:to_do/styles/text.dart';

class MyTheme {
  static ThemeData LightTheme = ThemeData(
    textTheme: MyTextTheme.textLight.textTheme,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff5D9CEC),
          onPrimary: Colors.white,
          secondary: Color(0xff61E757),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xffDFECDB),
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white),
      scaffoldBackgroundColor: Color(0xffDFECDB),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ThemeData.light().colorScheme.primary),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: false, showUnselectedLabels: false));


  static ThemeData DarkTheme = ThemeData(
      textTheme: MyTextTheme.textDark.textTheme,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xff5D9CEC),
          onPrimary: Color(0xff060E1E),
          secondary: Colors.blue,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.black,
          background: Color(0xffDFECDB),
          onBackground: Colors.black,
          surface: Colors.black,
          onSurface: Colors.black),
      scaffoldBackgroundColor: Color(0xff060E1E),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.blue),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: false, showUnselectedLabels: false),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.black));
}
