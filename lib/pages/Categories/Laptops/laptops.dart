// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
// import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
// ignore: unused_import
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../../../widgets/drawer.dart';

class LapTops extends StatefulWidget {
  @override
  _LapTopsState createState() => _LapTopsState();
}

class _LapTopsState extends State<LapTops> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/files/laptop.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["laptops_products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gadget Zone",
          style: TextStyle(color: Color.fromARGB(255, 0, 255, 221)),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 255, 221)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
            child: IconButton(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              icon: Icon(
                MdiIcons.cartOutline,
                color: Color.fromARGB(255, 78, 255, 8),
              ),
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            ).badge(
                color: Color.fromARGB(255, 0, 0, 0),
                size: 22,
                count: _cart.items.length,
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 255, 200),
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 280.0,
                width: double.infinity,
                child: Carousel(
                  dotSize: 6.0,
                  dotSpacing: 15.0,
                  dotPosition: DotPosition.bottomCenter,
                  images: [
                    Image.asset('assets/images/BannerLaptop/banner1.jpg',
                        fit: BoxFit.fill),
                    Image.asset('assets/images/BannerLaptop/banner2.jpg',
                        fit: BoxFit.fill),
                    Image.asset('assets/images/BannerLaptop/banner3.jpg',
                        fit: BoxFit.fill),
                    Image.asset('assets/images/BannerLaptop/banner4.jpg',
                        fit: BoxFit.fill),
                    Image.asset('assets/images/BannerLaptop/banner5.jpg',
                        fit: BoxFit.fill),
                  ],
                ),
              ),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
