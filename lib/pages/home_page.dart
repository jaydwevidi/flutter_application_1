// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/users/user.dart';
import 'package:flutter_application_1/models/users/user_list.dart';
import 'package:flutter_application_1/widgets/home_page/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/user_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> myUserList = UserList.user;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    final jsonFile = await rootBundle.loadString("assets/json/users.json");
    final decodedData = jsonDecode(jsonFile);
    final dataList = decodedData["data"];

    log(dataList.toString());
    myUserList =
        List.from(dataList).map<Users>((item) => Users.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.cyanAccent),
          title: const Text(
            "My Home Page",
            textScaleFactor: 1.3,
          )),
      body: ListView.builder(
          itemCount: myUserList.length,
          itemBuilder: (context, index) {
            var positiont = index % 2;
            return UserWidget(item: myUserList[index]);
          }),
    );
  }
}