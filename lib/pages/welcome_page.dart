// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/signin_screen.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF000000)),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Glogo2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextSpan(
                        text: "Welcome To\n",
                        style: TextStyle(color: Colors.white, fontSize: 60),
                      ),
                      TextSpan(
                        text: "Gadget Zone",
                        style: TextStyle(
                            height: 1.5, color: Colors.blue, fontSize: 40),
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignInScreen();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 50),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                        border: Border.all(
                          width: 2,
                          color: Colors.blue.shade200,
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Explore",
                            style: TextStyle(
                                color: Colors.blue.shade200, fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.blue.shade200,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
