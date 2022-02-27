// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageURL =
        "https://static.wikia.nocookie.net/dccu/images/6/6f/JL_Wonder_Woman.jpg/revision/latest/scale-to-width-down/628?cb=20160914003449";
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.red,
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: const Text(
                "Jay Dwivedi",
              ),
              accountEmail: const Text(
                "jayraj1999@gmail.com",
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageURL),
              ),
            ),
          ),
          Column(
            children: [
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                ),
                leading: Icon(CupertinoIcons.home),
                onTap: () {
                  log("home Button Tapped");
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: Text(
                  "Alarm",
                  textScaleFactor: 1.2,
                ),
                leading: Icon(CupertinoIcons.alarm),
                onTap: () {
                  log("home Button Tapped");
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: Text(
                  "Music",
                  textScaleFactor: 1.2,
                ),
                leading: Icon(CupertinoIcons.double_music_note),
                onTap: () {
                  log("home Button Tapped");
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
