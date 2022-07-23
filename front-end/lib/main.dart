import 'dart:developer';

import 'package:flutter/material.dart';

//import 'package:flutter_application_1/addSite.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/products.dart';
import 'package:flutter_application_1/view/Publier.dart';
import 'package:flutter_application_1/view/accueil.dart';
import 'package:flutter_application_1/view/categorie2.dart';
import 'package:flutter_application_1/view/categories.dart';
import 'package:flutter_application_1/view/categories1.dart';
import 'package:flutter_application_1/view/colis.dart';
import 'package:flutter_application_1/view/connecte.dart';
import 'package:flutter_application_1/view/detail_shopping.dart';
import 'package:flutter_application_1/view/logo.dart';
import 'package:flutter_application_1/view/notif.dart';
import 'package:flutter_application_1/view/profile.dart';
import 'package:flutter_application_1/view/promo_product.dart';
import 'package:flutter_application_1/view/shopping.dart';
import 'package:flutter_application_1/view/signup.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Logo(),
      routes: {
        "/Logo": (context) => Logo(),
        "/Categories": (context) => Categories(),
        "/Categorie1": (context) => Categorie1(),
        "/Categorie2": (context) => Categorie2(),
        "/Accueil": (context) => Accueil(),
        "/Shopping": (context) => Shopping(),

        //"/DetailShopping": (context) => DetailShopping()
      },
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   checkLoginStatus();
  // }

  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString("accessToken") == null) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => Login()),
  //         (Route<dynamic> route) => false);
  //   }
  // }

}
