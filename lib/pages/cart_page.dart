// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(0, 214, 0, 0),
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 140,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, _) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(Color.fromARGB(255, 21, 250, 29))
                    .make();
              },
            ),
            10.widthBox,
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not supported yet.".text.make(),
                ));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 48, 39, 180))),
              child: "Buy".text.white.make(),
            ).w32(context)
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show"
            .text
            .color(Color.fromARGB(255, 255, 17, 0))
            .xl3
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
                color: Color.fromARGB(255, 72, 255, 0),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Color.fromARGB(255, 247, 0, 0),
                ),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].name.text
                  .color(Color.fromARGB(255, 255, 255, 255))
                  .make(),
            ),
          );
  }
}
