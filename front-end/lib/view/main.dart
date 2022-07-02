import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/addSite.dart';

import 'package:flutter_application_1/forgetpossword.dart';
import 'package:flutter_application_1/view/homePage.dart';

import 'package:flutter_application_1/njareb/amal.dart';
import 'package:flutter_application_1/njareb/cite_list.dart';

import 'package:flutter_application_1/view/login.dart';

import 'package:flutter_application_1/forgot.dart';
import 'package:flutter_application_1/njareb/citeaddedite.dart';
import 'package:flutter_application_1/njareb/cites.dart';

import 'package:flutter_application_1/view/signup.dart';
import 'package:flutter_application_1/view/site.dart';

import 'package:flutter_application_1/view/alert.dart';
import 'package:flutter_application_1/view/sensor.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'njareb/cite_list.dart';

//Widget _defaultHome = const LoginPage();
void main() async {
  /*bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = HomePage();
  }*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        /*  '/home': (context) => HomePage(),
        '/login': (context) => const LoginPage(),*/
        "login": (context) => Login(),
        "signup": (context) => Signup(),
        "homepage": (context) => HomePage(),

        "AddSite": (context) => AddSite(),
        //"/CiteAdd": (context) => CiteAdd(),
        // "/CitList": (context) => CiteList(),
        //"amal": (context) => getServiceTypes(),
        "Forgot": (context) => Forgot(),
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
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
