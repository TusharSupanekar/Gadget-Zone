// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/Categories/Laptops/laptops.dart';
import 'package:flutter_catalog/pages/Categories/Smartphones/smartphone.dart';
import 'package:flutter_catalog/pages/Categories/Tv/tv.dart';
import 'package:flutter_catalog/pages/Categories/headphones/headphone.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/signup_screen.dart';
import 'package:flutter_catalog/pages/welcome_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '/pages/signin_screen.dart';

import 'core/store.dart';
import 'pages/home_page.dart';
import 'widgets/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDiM_e6bc9gh5nnA_AHDpEsD0bCIkLXN_w",
        appId: "1:852789607826:android:b22ba712982c0248c1954b",
        messagingSenderId: "852789607826",
        projectId: "loginsignup3-807d1"),
  );
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => WelcomePage(),
        MyRoutes.startRoute: (context) => WelcomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.signupRoute: (context) => SignUpScreen(),
        MyRoutes.loginRoute: (context) => SignInScreen(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.phoneRoute: (context) => SmartPhone(),
        MyRoutes.headphoneRoute: (context) => HeadPhone(),
        MyRoutes.tvRoute: (context) => Tv(),
        MyRoutes.laptopRoute: (context) => LapTops(),
      },
    );
  }
}
