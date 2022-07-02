import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homePage.dart';
import 'package:flutter_application_1/model/user_register.dart';
import 'package:flutter_application_1/view/login.dart';
//import 'package:flutter_application_1/user.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:http/http.dart' as http;
//import 'package:form_validator/form_validator.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _nomController = TextEditingController();
  TextEditingController _PrenomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  //Future<User>
  userSignUp(String nom, String prenom, String email, String password) async {
    var url = Uri.parse("http://192.168.1.172:3008/api/user/register");

    String data = jsonEncode(
        {'nom': nom, 'prenom': prenom, 'email': email, 'password': password});

    print("ma7abch ye5dem  $data");
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: (data));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var user = User.fromJson(jsonResponse);
      print("Response status : ${response.body}");

      return User.fromJson(jsonResponse);
    } else {
      throw Exception('Fail to sign up user ');
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
            )),
        Container(
          alignment: Alignment.center,

          //margin: EdgeInsets.all(10),
          child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Signup",
                    style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  usernameTextField(),
                  lastNameTextField(),
                  emailTextField(),
                  passwordTextField(),
                  //confirmpasswordTextField(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 50,
                      width: 400,
                      child: FlatButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(52)),
                        onPressed: () {
                          setState(() {
                            if (_key.currentState!.validate()) {
                              userSignUp(
                                  _nomController.text,
                                  _PrenomController.text,
                                  _emailController.text,
                                  _passwordController.text);
                            }
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Login()),
                                (Route<dynamic> route) => false);
                          });
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text("Already have Account ? "),
                        InkWell(
                          child: Text(
                            "Signin",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.pop(context);
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

  Widget usernameTextField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          children: [
            // Text("username"),
            TextFormField(
                controller: _nomController,
                keyboardType: TextInputType.text,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'FirstName Empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "FirstName",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  //focusedBorder: UnderlineInputBorder(
                  //  borderSide: BorderSide(color: Colors.black, width: 2)),
                ))
          ],
        ));
  }

  Widget lastNameTextField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          children: [
            // Text("username"),
            TextFormField(
                controller: _PrenomController,
                keyboardType: TextInputType.text,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'LastName Empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "LastName",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  //focusedBorder: UnderlineInputBorder(
                  //  borderSide: BorderSide(color: Colors.black, width: 2)),
                ))
          ],
        ));
  }

  Widget emailTextField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          children: [
            //Text("email"),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) return "Email can't be empty";
                if (!value.contains("@")) return "Email is invalid";
                return null;
              },
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
              ),
            ),

            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black, width: 2))),
          ],
        ));
  }

  Widget passwordTextField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          children: [
            // Text("password"),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'password Empty';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "password ",
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
              ),
            ),

            // focusedBorder: UnderlineInputBorder(
            //  borderSide: BorderSide(color: Colors.black, width: 2)),
          ],
        ));
  }

  Widget confirmpasswordTextField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          children: [
            // Text("password"),
            TextFormField(
              controller: _confirmpasswordController,
              keyboardType: TextInputType.text,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'confirm password Empty';
                  if (val != _passwordController.text)
                    return "two password not match";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "password ",
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
              ),
            ),

            // focusedBorder: UnderlineInputBorder(
            //  borderSide: BorderSide(color: Colors.black, width: 2)),
          ],
        ));
  }
}
