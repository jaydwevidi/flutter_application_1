import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  var coutn = 0;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Column(
        children: [
          SizedBox(
              height: 200,
              child: Image.asset(
                "assets/images/a.png",
                fit: BoxFit.fill,
              )),
          Text(
            'This is Google Fonts 2',
            style: GoogleFonts.getFont('Lato'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter the Username 2",
                    hoverColor: Colors.teal,
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Enter The Password Please"),
                    focusColor: Colors.blue,
                    hoverColor: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              log("Button Pressed $coutn");
              coutn++;
            },
            child: const Text('Button'),
          )
        ],
      ),
    ));
  }
}
