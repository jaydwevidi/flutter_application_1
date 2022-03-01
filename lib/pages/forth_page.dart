// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/product_details.dart';

import '../models/users/user.dart';

class ForthPage extends StatefulWidget {
  const ForthPage({Key? key}) : super(key: key);

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  List<User> myUserList = List<User>.empty();
  bool listReady = false;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final jsonFile = await rootBundle.loadString("assets/json/users.json");
    final decodedData = jsonDecode(jsonFile);
    final dataList = decodedData["data"];

    log(dataList.toString());
    myUserList =
        List.from(dataList).map<User>((item) => User.fromMap(item)).toList();

    listReady = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.cyanAccent,
        ),
        title: const Text(
          "Trending Products",
          textScaleFactor: 1.3,
        ),
      ),
      body: listReady
          ? SafeArea(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: myUserList.length,
                itemBuilder: (context, index) {
                  final User x = myUserList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                  item: x, position: index)));
                    },
                    child: SingleCatalogItemCard(
                      item: myUserList[index],
                      position: index,
                    ),
                  );
                },
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class SingleCatalogItemCard extends StatelessWidget {
  final User item;
  final int position;

  const SingleCatalogItemCard(
      {Key? key, required this.item, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 239, 239, 240),
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            child: Hero(
              tag: (item.id.toString() + position.toString()),
              child: Image.network(
                item.avatar,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  (item.first_name + " " + item.last_name).toUpperCase(),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Text(
                  item.email,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ButtonBar(
                  buttonPadding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$99${item.id}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          fontSize: 20),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Buy".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide(color: Colors.red)))))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
