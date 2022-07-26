import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/notif.dart';

import 'package:flutter_application_1/view/Logo.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                email(),
                password(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60, left: 60),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: RaisedButton(
                      color: Colors.indigo[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Notif()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        "valider",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("En validant vous acceptez les CGV "),
                Text("et la politique de confidentialité"),
              ],
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/Logo");
                    },
                  ),
                  // SizedBox(
                  //   width: 2,
                  // ),
                  Text(
                    "retour",
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  )
                ])
              ])
        ]));
  }

  Widget email() {
    return Padding(
        padding: EdgeInsets.only(right: 50, left: 50),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(50)),
          child: TextFormField(
              textAlign: TextAlign.center,
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'email',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xFFF5F5F5))),
              )),
        ));
  }

  Widget password() {
    return Padding(
        padding: EdgeInsets.only(top: 20, right: 50, left: 50),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(50)),
          child: TextFormField(
              textAlign: TextAlign.center,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'mot de passe',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Color(0xFFF5F5F5)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xFFF5F5F5))),
              )),
        )

        // return Padding(
        //   padding: EdgeInsets.only(top: 20, right: 50, left: 50),
        // return Container(
        //   // padding: EdgeInsets.only(top: 20, right: 50, left: 50),
        //   decoration: BoxDecoration(
        //       color: Colors.grey, borderRadius: BorderRadius.circular(50)),
        //   child: TextFormField(
        //       controller: _passwordController,
        //       decoration: InputDecoration(
        //         hintText: 'Password',
        //         // enabledBorder: OutlineInputBorder(
        //         //     borderRadius: BorderRadius.circular(50),
        //         //     borderSide: BorderSide(color: Colors.blue)),
        //       )),
        );
  }
}
