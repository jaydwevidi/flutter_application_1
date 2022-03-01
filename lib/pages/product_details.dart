// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/users/user.dart';

class ProductDetailsPage extends StatelessWidget {
  final User item;
  final int position;
  const ProductDetailsPage({
    Key? key,
    required this.item,
    required this.position,
  }) : super(key: key);

/*style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24
              )),*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            (item.first_name + " " + item.last_name).toUpperCase(),
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
            )),
          ),
          iconTheme: const IconThemeData(
            color: Colors.cyanAccent,
          )),
      body: InteractiveViewer(
        child: Center(
          child: Hero(
            tag: item.id.toString() + position.toString(),
            child: Image.network(
              item.avatar,
            ),
          ),
        ),
      ),
    );
  }
}
