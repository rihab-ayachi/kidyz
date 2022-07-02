import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';

import 'package:flutter_application_1/model/station_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIServiceStation {
  static var client = http.Client();
  //static List<Map<String, dynamic>>? areas = [];
  static List name = [];
  static List site = [];
  static List get getAreas => name;
  static List get getSite => site;

  static Future<List<StationModel>?> getallstations(String userid) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("id"));
    var data = {"userid": _sp.getString("id")};
    var url = Uri.parse("http://192.168.1.71:3008/api/station/getallstations");
    var response = await client.post(url, headers: {}, body: data);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      // for (var x in body['cite']) {
      //   print(" ======> $x");
      //   site.add(x['area']);
      // }

      //   setState(() {
      //       for (var x in body) {
      //     areas.add(x['area']);
      //   }
      //   print("cites $areas");

      // });

      for (var x in body) {
        name.add(x['name']);
      }
      print("station $name");

      print("station les cites $body");

      return stationFromJson(body);
    } else {
      print("mch bch te5dem ${response.statusCode}");
    }
  }

  static Future<StationModel> addstation(
    String name,
    String localisation,
    double lattitude,
    double longitude,
    String cite,
  ) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    print(_sp.getString("id"));
    var dat = {"userid": _sp.getString("id")};
    var url = Uri.parse("http://192.168.1.71:3008/api/cite/addstation");

    String data = jsonEncode({
      'name': name,
      'localisation': localisation,
      'lattitude': lattitude,
      'longitude': longitude,
      'cite': cite,
      "userid": _sp.getString("id"),
    });
    print("9bell manb3eth $data");

    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var cite = StationModel.fromJson(jsonResponse);
      print("/////////////////////////////////// : ${response.body}");

      return StationModel.fromJson(jsonResponse);
    } else {
      throw Exception('Fail to sign up user ');
    }
  }
}
