import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homePage.dart';
import 'package:flutter_application_1/view/login.dart';
import 'package:flutter_application_1/view/profile.dart';

class Home4 extends StatefulWidget {
  Home4({Key? key}) : super(key: key);

  @override
  State<Home4> createState() => _Home4State();
}

class _Home4State extends State<Home4> {
  PageController pageController = PageController();

  int _currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    Login(),
    Profile(),
  ];

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
