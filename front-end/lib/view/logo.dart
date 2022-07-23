import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/connecte.dart';
import 'package:flutter_application_1/view/notif.dart';
import 'package:flutter_application_1/view/signup.dart';

class Logo extends StatefulWidget {
  Logo({Key? key}) : super(key: key);

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image(
        image: AssetImage("images/backg.jpg"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fill,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Image(
              image: AssetImage("images/logo.png"),
              width: 300,
              height: 100,
            ),
            SizedBox(
              height: 100,
            ),

            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text("Achetez, Vendez ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(" tout le necessaire pour vous enfants",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 50, left: 50),
                    child: Container(
                      height: 50,
                      width: 400,
                      child: RaisedButton(
                        color: Color.fromARGB(255, 36, 180, 190),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Signup()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "s'inscrire",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 50, left: 50),
                    child: Container(
                      height: 50,
                      width: 400,
                      child: RaisedButton(
                        color: Color.fromARGB(255, 36, 180, 190),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Connect()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "se connecter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("voir les CGV"),
                ])),
            Flexible(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("    1457 utilisateurs\n245 articles disponibles "),
            )),
            SizedBox(
              height: 20,
            ),
            // Flexible(
            //     child: Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Text("245 articles disponibles"),
            // )),
          ])
    ]));
  }
}
