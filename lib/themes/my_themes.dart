import 'package:flutter/material.dart';

class MyThemes{
  static ThemeData getLightThemeData(BuildContext context){
    var myLightTheme = ThemeData(
      primaryColor: Colors.yellow,
      primarySwatch: Colors.amber,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.deepPurple,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
      ),
    );
    return myLightTheme;
  }

  static ThemeData getDarkThemeData(BuildContext myContext){
    var myLightTheme = ThemeData(
      brightness: Brightness.dark
    );
    return myLightTheme;
  }
}