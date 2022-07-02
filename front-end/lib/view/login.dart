//import 'dart:html';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/site/AddSite.dart';
import 'package:flutter_application_1/njareb/cite_list.dart';
import 'package:flutter_application_1/shared/sharedPref.dart';
import 'package:flutter_application_1/view/home4.dart';
import 'package:flutter_application_1/view/homePage.dart';
import 'package:flutter_application_1/view/profile.dart';
//import 'package:flutter_application_1/new.dart';
import 'package:flutter_application_1/view/signup.dart';
import 'package:flutter_application_1/view/station/addstation.dart';
import 'package:flutter_application_1/view/station/station_list.dart';
import 'package:flutter_application_1/model/user_login.dart';
import 'package:flutter_application_1/view/token.dart';

import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  signIn(String email, String password) async {
    var url = Uri.parse("http://192.168.1.71:3008/api/user/login");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String data = jsonEncode({'email': email, 'password': password});
    var jsonResponse;
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      var user = User.fromJson(jsonResponse);
      print("Response status : ${response.statusCode}");
      print("Response status : ${response.body}");
      print("Response status : ${response.body}");
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });

        sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
        sharedPreferences.setString("id", jsonResponse['id']);
        sharedPreferences.setString("nom", jsonResponse['nom']);
        sharedPreferences.setString("prenom", jsonResponse['prenom']);

        sharedPreferences.setString("email", jsonResponse['email']);

        SharedPref.saveToken(jsonResponse['id'], jsonResponse['nom'],
            jsonResponse['prenom'], jsonResponse['email']);

        print(user.token);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home4()),
            (Route<dynamic> route) => false);
      }
      Fluttertoast.showToast(
          msg: "Login succée! welcome",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 31, 131, 212),
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      setState(() {
        _isLoading = false;
      });
      print("Response status : ${response.body}");
    }
    if (response.statusCode == 400) {
      Fluttertoast.showToast(
          msg: "License Expired",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    savePref() async {
      SharedPreferences preference = await SharedPreferences.getInstance();
      preference.setString("email", email);
      print(preference.getString("email"));
    }
  }

  bool vis = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            "images/top.jpg",
            width: 400,
            height: 150,
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 0),
          child: Form(
              //key: _formKey,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Signin",
                style: GoogleFonts.pacifico(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 25,
              ),
              email(),
              password(),
              /*  Padding(
                  padding: EdgeInsets.all(16),*/
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                //Row(children: [
                InkWell(
                  child: Text(
                    "Forget Password",
                    style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.blue),
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
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  height: 50,
                  width: 400,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    onPressed: _emailController.text == "" ||
                            _passwordController.text == ""
                        ? null
                        : () {
                            setState(() {
                              _isLoading = true;
                            });
                            signIn(_emailController.text,
                                _passwordController.text);
                          },
                    child: Text(
                      "signin",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text("    Not have Account ? "),
                    InkWell(
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("signup");
                      },
                    )
                  ],
                ),

                /*
              RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                onPressed: () {
                  //  Navigator.of(context).pushNamed("HomePage");
                },
                child: Text("Valider"),
              )*/
              )
            ],
          )),
        )
      ],
    )));
  }

  Widget email() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
          /* controller: TextEditingController(text: user.username),
          onChanged: (value) {
            user.username = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter something';
            } else if (RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                .hasMatch(value)) {
              return null;
            } else {
              return 'Enter valid email';
            }
          },*/
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red)),
          )),
    );
  }

  Widget password() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      /*decoration: BoxDecoration(
            color: Colors.grey[500], borderRadius: BorderRadius.circular(16)),
        child: Center(*/
      child: TextFormField(
          controller: _passwordController,
          /*controller: TextEditingController(text: user.username),
          onChanged: (value) {
            user.username = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter something';
            }
            return null;
          },*/
          obscureText: vis,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Colors.blue,
            ),
            suffixIcon: IconButton(
              icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  vis = !vis;
                });
              },
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red)),
          )),
    );
  }
}
