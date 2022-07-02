import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  static var client = http.Client();
  //static List<Map<String, dynamic>>? areas = [];
  static List areas = [];
  static List get getAreas => areas;

  static Future<List<CiteModel>?> getallcites(String userid) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("id"));
    var data = {"userid": _sp.getString("id")};
    var url = Uri.parse("http://192.168.1.71:3008/api/cite/getallcites");
    var response = await client.post(url, headers: {}, body: data);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      //   setState(() {
      //       for (var x in body) {
      //     areas.add(x['area']);
      //   }
      //   print("cites $areas");

      // });

      for (var x in body) {
        areas.add(x['area']);
      }
      print("cites $areas");

      print("hedhem les cites $body");

      return citeFormJson(body);
    } else {
      print("mch bch te5dem ${response.statusCode}");
    }
  }

  static Future<List<CiteModel>?> update(String _id) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("_id"));
    var data = {"_id": _sp.getString("_id")};
    var url = Uri.parse("http://192.168.1.71:3008/api/cite/update");
    var response = await client.post(url, headers: {}, body: data);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print("update //////////////////////$body");

      return citeFormJson(body);
    } else {
      print("mch bch te5dem ${response.statusCode}");
    }
  }

  var dat;
  static Future<CiteModel> addcite(String area, String description,
      double lattitude, double longitude, String userid) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("id"));
    var dat = {"userid": _sp.getString("id")};
    var url = Uri.parse("http://192.168.1.71:3008/api/cite/addcite");

    String data = jsonEncode({
      'area': area,
      'description': description,
      'lattitude': lattitude,
      'longitude': longitude,
      "userid": _sp.getString("id"),
    });
    print("9bell manb3eth $data");

    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var cite = CiteModel.fromJson(jsonResponse);
      print("/////////////////////////////////// : ${response.body}");

      //print("hedhi  $response");
      return CiteModel.fromJson(jsonResponse);
    } else {
      //print(response.statusCode.toString());
      throw Exception('Fail to sign up user ');
    }
  }

  /* static Future<bool> deleteCite(String? id) async {
    Map<String, String> requestHeaders = {};
    var url = Uri.parse("192.168.137.117:3008/api/cite/delete");
    var response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }*/

}
