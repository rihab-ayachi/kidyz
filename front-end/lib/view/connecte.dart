import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Accueil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Connect extends StatefulWidget {
  Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> formStatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formStatesignup = new GlobalKey<FormState>();
  savePref(String username, String email, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("id", id);
    preferences.setString("username", username);
    preferences.setString("email", email);
    print(preferences.getString("username"));
    print(preferences.getString("email"));
    print(preferences.getString("id"));
  }

  Future login() async {
    var url = Uri.parse("http://192.168.1.179/meilleavinted/login.php");
    var response = await http.post(url, body: {
      "email": _emailController.text,
      "password": _passwordController.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        textColor: Colors.green,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Accueil(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: 'Username and password invalid', textColor: Colors.red);
    }
  }

  // signin() async {
  //   var formdata = formStatesignin.currentState;
  //   if (formdata!.validate()) {
  //     print("not valid");
  //   } else {
  //     formdata.save();
  //     var data = {
  //       "email": _emailController.text,
  //       "password": _passwordController.text
  //     };
  //     var url = Uri.parse("http://192.168.1.90/meilleavinted/login.php");

  //     var response = await http.post(url, body: data);
  //     var responsebody = jsonDecode(response.body);
  //     if (responsebody['status'] == "success") {
  //       savePref(responsebody['username'], responsebody['email'],
  //           responsebody['id']);
  //       Navigator.of(context).pushNamed("Accueil");
  //     } else {
  //       print("login faild");
  //       if (Navigator.of(context).canPop()) {
  //         Navigator.of(context).pop();
  //       }
  //     }
  //   }
  // }

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
          // "",
          // style: GoogleFonts.pacifico(
          //     fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue),

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
                  padding: EdgeInsets.only(right: 50, left: 50),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: RaisedButton(
                      color: Colors.indigo[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      onPressed: () {
                        login();
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Accueil()),
                        //     (Route<dynamic> route) => false);
                      },
                      child: Text(
                        "se connecter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  //Row(children: [
                  InkWell(
                    child: Text(
                      "mot de passe oublié",
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("Forgot");
                    },
                  ),
                  // Text("    Not have Account ? "),
                  /* InkWell(


                  
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("signup");
                    },
                  )*/
                ]),
              ]))
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
