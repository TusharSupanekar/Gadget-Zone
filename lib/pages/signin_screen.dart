// ignore_for_file: prefer_const_constructors, avoid_print, duplicate_ignore

import goku'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/welcome_page.dart';

import '/reusable_widgets/reusable_widget.dart';

import '/pages/signup_screen.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SingleChildScrollView(
          child: Form(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.8),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 3,
                  color: Colors.blue,
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(190),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WelcomePage()));
                    }, // Image tapped
                    child: Image.asset(
                      "assets/images/Glogo2.png",
                      fit: BoxFit.cover,
                      height: 140,
                      width: 140.0,
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailTextController,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade100, width: 2.0),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade900, width: 2.0),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      hintText: "Enter Username",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _passwordTextController,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade100, width: 2.0),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade300, width: 2.0),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  firebaseUIButton(context, "Sign In", () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? ",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.limeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
