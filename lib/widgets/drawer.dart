// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../pages/Categories/Laptops/laptops.dart';
import '../pages/Categories/Smartphones/smartphone.dart';
import '../pages/Categories/Tv/tv.dart';
import '../pages/Categories/headphones/headphone.dart';
import '../pages/signin_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color.fromARGB(255, 0, 255, 213)),
                  ),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                margin: EdgeInsets.zero,
                accountName: Text(
                  "",
                  style: TextStyle(color: Color.fromARGB(255, 0, 247, 255)),
                ),
                accountEmail: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    "goku@gmail.com",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 247, 255)),
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 255, 221),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/Glogo2.png"),
                    radius: 31,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                MdiIcons.home,
                color: Color.fromARGB(255, 4, 255, 242),
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()))
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.cellphone,
                color: Color.fromARGB(255, 0, 174, 255),
              ),
              title: Text(
                "SmartPhones",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SmartPhone()))
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.laptop,
                color: Color.fromARGB(255, 251, 255, 0),
              ),
              title: Text(
                "Laptops",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LapTops()))
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.headphones,
                color: Color.fromARGB(255, 14, 0, 136),
              ),
              title: Text(
                "HeadPhones",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HeadPhone()))
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.monitor,
                color: Color.fromARGB(255, 128, 255, 0),
              ),
              title: Text(
                "TV",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Tv()))
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.logout,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
              },
            ),
            SizedBox(
              height: 190,
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 2,
              endIndent: 2,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  MdiIcons.facebook,
                  size: 50,
                  color: Color.fromARGB(255, 32, 147, 255),
                ),
                Icon(
                  MdiIcons.instagram,
                  size: 50,
                  color: Color.fromARGB(255, 255, 0, 221),
                ),
                // ignore: prefer_const_constructors
                Icon(
                  MdiIcons.twitter,
                  size: 50,
                  color: Color.fromARGB(255, 6, 255, 243),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
