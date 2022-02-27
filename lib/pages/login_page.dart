import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String isPrime(int num) {
  int i;

  for (i = 2; i < num; i++) {
    if (num % i == 0) {
      log("$num divisible by $i");
      return "Not Prime";
    }
  }
  return "Prime";
}

class _LoginPageState extends State<LoginPage> {
  var numCount = 0;
  var name = "";
  var inkwellWidth = 150;
  var changeButtonWidth = false;
  final _formKey = GlobalKey<FormState>();
  var isPrimeBool = "Not Prime ";

  moveToHome(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {

    }

    numCount++;
    isPrimeBool = isPrime(numCount);
    log("Button Pressed $numCount $isPrimeBool");

    setState(() {});

    //Navigator.pushNamed(context, "/homePage");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/images/a.png",
                  fit: BoxFit.fitHeight,
                )),
            Text(
              '$name Google Fonts $numCount $isPrimeBool',
              style: GoogleFonts.getFont('Lato'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (changedValue) {
                        name = changedValue;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "User name is Empty";
                          }
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter the Username 0",
                        hoverColor: Colors.teal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Enter The Password Please 4"),
                        focusColor: Colors.blue,
                        hoverColor: Colors.teal,
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Password is Empty";
                          } else if (value.length < 8) {
                            return "Password is less than 8 characters";
                          }
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () => moveToHome(context),
              child: const Text('Button 2'),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  log("inkwell tapped");
                  if (inkwellWidth == 150) {
                    inkwellWidth = 500;
                  } else {
                    inkwellWidth = 150;
                  }

                  changeButtonWidth = true;
                });
              },
              child: AnimatedContainer(
                transformAlignment: Alignment.center,
                duration: const Duration(milliseconds: 2120),
                height: 50,
                width: inkwellWidth.toDouble(),
                child: const Center(
                    child: Text(
                  "Inkwell Animated Container",
                  textAlign: TextAlign.center,
                )),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.3)),
                //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
