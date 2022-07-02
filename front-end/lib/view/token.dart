import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/shared/sharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/shared/sharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Token extends StatefulWidget {
  Token({Key? key}) : super(key: key);
  State<Token> createState() => _TokenState();
}

class _TokenState extends State<Token> {
  late String? id;
  late String? email;
  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString("id");
    email = sharedPreferences.getString("email");
  }

  @override
  initState() {
    getToken();
    //id = SharedPref.getToken() as String;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        child: id != null ? Text(id!) : Text("Loading"),
      ),
      Container(
        child: email != null ? Text(email!) : Text("Loading"),
      )
    ]));
  }
}
