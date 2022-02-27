import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/users/user.dart';

class UserWidget extends StatelessWidget {
  final Users item;

  const UserWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      child: Card(
        shadowColor: Colors.red,
        child: ListTile(
          title: Text(item.first_name + " " + item.last_name),
          leading: Card(
            elevation: 0,
            child: SizedBox(
              width: 60,
              height: 60,
              child: Image.network(
                item.avatar,
                fit: BoxFit.fill,
              ),
            ),
          ),
          subtitle: Text(item.email),
          trailing: Text(
            "\$99${item.id}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.lightBlue),
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}
