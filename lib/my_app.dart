// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/choose_page.dart';
import 'package:flutter_application_1/pages/forth_page.dart';
import 'package:flutter_application_1/pages/gird_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/themes/my_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: MyThemes.getDarkThemeData(context),

      //home: const HomePage(),
      theme: MyThemes.getLightThemeData(context),
      routes: {
        "/": (context) => const ChoosePage(),
        "/homePage": (context) => const HomePage(),
        "/loginPage": (context) => const LoginPage(),
        "/gridPage": (context) => GridPage(),
        "/forthPage": (context) => const ForthPage(),
      },
    );
  }
}
