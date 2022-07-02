import 'dart:convert';
//import '../widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'model/user_login.dart';

class Forgot extends StatefulWidget {
  Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  bool _isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  reset(String email, String password) async {
    var url = Uri.parse("http://192.168.1.49:3008/api/user/resetpassword");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String token = await Candidate().getToken();

    // String? accessToken = sharedPreferences.getString("token");

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
        //String token = jsonResponse['response']['token'];

        /*sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
        print(user.token);*/
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Login()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print("Response status : ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // BackgroundImage(),
        Scaffold(
            body: Container(
      decoration: new BoxDecoration(color: Color.fromARGB(255, 145, 176, 202)),

      /*image: DecorationImage(
              image: AssetImage('images/image.jpg'), fit: BoxFit.cover)),*/
      child: Center(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(""),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    hintText: "new password",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        onPressed: (() {}),
                                        child: Text("back"),
                                        color:
                                            Color.fromARGB(255, 155, 202, 243),
                                      ),
                                      SizedBox(
                                        width: 120,
                                      ),
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        color:
                                            Color.fromARGB(255, 155, 202, 243),
                                        onPressed: _emailController.text ==
                                                    "" ||
                                                _passwordController.text == ""
                                            ? null
                                            : () {
                                                setState(() {
                                                  _isLoading = true;
                                                });
                                                reset(_emailController.text,
                                                    _passwordController.text);
                                              },
                                        child: Text("save"),
                                      )
                                    ],
                                  ))
                            ]))),
                  ]))),
    ));
  }
}
