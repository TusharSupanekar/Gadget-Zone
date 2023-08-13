// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Color.fromARGB(255, 250, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
