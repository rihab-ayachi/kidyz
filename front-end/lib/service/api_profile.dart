import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';

import 'package:flutter_application_1/model/station_model.dart';
import 'package:flutter_application_1/model/user_login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIServiceProfile {
  static var client = http.Client();
  //static List<Map<String, dynamic>>? areas = [];

  static Future<List<StationModel>?> resetpassword(String userid) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("id"));
    var data = {"userid": _sp.getString("id")};
    var url = Uri.parse("http://192.168.1.71:3008/api/user/resetpassword");
    var response = await client.post(url, headers: {}, body: data);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print("station les cites $body");

      return stationFromJson(body);
    } else {
      print("mch bch te5dem ${response.statusCode}");
    }
  }

  static Future<User> reset(String email, String password) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("email"));
    var dat = {"userid": _sp.getString("id")};
    var url = Uri.parse("http://192.168.56.170:3008/api/user/resetpassword");

    String data = jsonEncode({
      "password": password,
      "email": _sp.getString("email"),
    });
    print("9bell manb3eth $data");

    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var user = User.fromJson(jsonResponse);
      //var  = User.fromJson(jsonResponse);
      print("/////////////////////////////////// : ${response.body}");

      return User.fromJson(jsonResponse);
    } else {
      throw Exception('Fail to sign up user ');
    }
  }
}
