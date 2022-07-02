import 'dart:developer';

import 'package:flutter/material.dart';

//import 'package:flutter_application_1/addSite.dart';

import 'package:flutter_application_1/forgetpossword.dart';
import 'package:flutter_application_1/shared/sharedPref.dart';
import 'package:flutter_application_1/view/home1.dart';
import 'package:flutter_application_1/view/homePage.dart';
import 'package:flutter_application_1/view/licence.dart';
import 'package:flutter_application_1/view/site/AddSite.dart';
import 'package:flutter_application_1/njareb/amal.dart';
import 'package:flutter_application_1/njareb/cite_list.dart';

import 'package:flutter_application_1/view/login.dart';

import 'package:flutter_application_1/forgot.dart';
import 'package:flutter_application_1/njareb/citeaddedite.dart';
import 'package:flutter_application_1/njareb/cites.dart';
import 'package:flutter_application_1/view/profile.dart';

import 'package:flutter_application_1/view/signup.dart';
import 'package:flutter_application_1/view/Site.dart';

import 'package:flutter_application_1/view/alert.dart';
import 'package:flutter_application_1/view/sensor.dart';
import 'package:flutter_application_1/view/site/updatesite.dart';
import 'package:flutter_application_1/view/station/addstation.dart';
import 'package:flutter_application_1/view/station/station_list.dart';
import 'package:flutter_application_1/view/Site.dart';
import 'package:flutter_application_1/view/token.dart';
import 'package:flutter_application_1/view/device/adddevice.dart';

//import 'package:flutter_application_1/shared/sharedPref.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/main.dart';

void main() async {
  runApp(MyApp());
  SharedPreferences prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        "Token": (context) => Token(),
        "Licence": (context) => Licence(),
        "AddSite": (context) => AddSite(),
        "AddStation": (context) => AddStation(),

        // "AddSite": (context) => AddSite(),
        "/CiteAdd": (context) => CiteAdd(),
        "/CitList": (context) => CiteList(),
        //"amal": (context) => getServiceTypes(),
        "Forgot": (context) => Forgot(),
        "/StationList": (context) => StationList(),

        ///"Site": (context) => Site(),

        "Sensor": (context) => Sensor(),
        //"/CiteAdd": (context) => CiteAdd(),
        "Alert": (context) => Alert(),
        "Profile": (context) => Profile(),
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
  PageController pageController = PageController();

  int _currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    Profile(),
    Login(),
  ];

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // onTap: onTap,
        // currentIndex: _currentIndex,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _currentIndex == 0 ? Colors.blue : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail,
                color: _currentIndex == 1 ? Colors.blue : Colors.grey),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _currentIndex == 2 ? Colors.blue : Colors.grey),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
