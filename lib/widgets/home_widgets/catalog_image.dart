import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        .rounded
        .p4
        .border(color: Color.fromARGB(255, 245, 245, 245))
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
