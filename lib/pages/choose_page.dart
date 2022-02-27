// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/loginPage");
                },
                child: Text("Login Page")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/homePage");
                },
                child: Text("Home Page"))
          ],
        ),
      ),
    );
  }
}
