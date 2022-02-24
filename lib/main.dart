import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //themeMode: ThemeMode.system,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        drawer: const Drawer(
            child: Center(
          child: Text("Drawer Text"),
        )),
        appBar: AppBar(),
        body: const Center(
          child: Text(
            "Hello world ",
            style: TextStyle(color: Colors.red, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
