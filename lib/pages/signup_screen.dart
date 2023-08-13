// ignore_for_file: prefer_const_constructors, avoid_print, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_catalog/pages/signin_screen.dart';
import 'package:flutter_catalog/pages/welcome_page.dart';

import '/reusable_widgets/reusable_widget.dart';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: SingleChildScrollView(
            child: Form(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
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
                height: 25,
              ),
              Text(
                "SignUp Here",
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userNameTextController,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade100, width: 2.0),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade300, width: 2.0),
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
                      height: 18,
                    ),
                    TextFormField(
                      controller: _emailTextController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade100, width: 2.0),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade300, width: 2.0),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        hintText: "Enter Email ID",
                        hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
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
                          borderSide: BorderSide(
                              color: Colors.blue.shade100, width: 2.0),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade300, width: 2.0),
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
                      height: 15,
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account? ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()));
                            },
                            child: Text(
                              "Login",
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
        )));
  }
}
