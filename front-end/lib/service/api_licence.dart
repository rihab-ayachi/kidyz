import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIServicelicence {
  static var client = http.Client();
  //static List<Map<String, dynamic>>? areas = [];
  static List areas = [];

  static Future<List<CiteModel>?> getinfo(String userid) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("_id"));
    var data = {"userid": _sp.getString("_id")};
    var url = Uri.parse("http://192.168.1.172:3008/api/user/userinfos");
    var response = await client.post(url, headers: {}, body: data);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      print("***************************** $body");
      

      return citeFormJson(body);
    } else {
      print("mch bch te5dem ${response.statusCode}");
    }
  }
}
