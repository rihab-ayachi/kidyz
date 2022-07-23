import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image(
            image: AssetImage("images/logo.png"),
            width: 180,
            height: 50,
          ),
          backgroundColor: Colors.pink[100],
          toolbarHeight: 100,
        ),
        body: Stack(children: [
          Image(
            image: AssetImage("images/backg.jpg"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  "Merci pour votre inscription",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "un email de confirmation ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "vous a été envoyé",
                  style: TextStyle(fontSize: 15),
                )
              ]))
        ]));
  }
}
