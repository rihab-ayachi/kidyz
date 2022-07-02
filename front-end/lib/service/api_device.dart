// import 'dart:convert';
// //import 'dart:html';

// import 'package:flutter/cupertino.dart';

// import 'package:flutter_application_1/model/station_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class APIServicedevice{
//   static var client = http.Client();
//   //static List<Map<String, dynamic>>? areas = [];
//   static List name = [];
//   static List get getdevice => name;

//   static Future<List<StationModel>?> getlatestdata(String userid) async {
//     SharedPreferences _sp = await SharedPreferences.getInstance();
//     print(_sp.getString("id"));
//     var data = {"userid": _sp.getString("id")};
//     var url = Uri.parse("http://192.168.1.70:3008/api/sensor/getlatestdata");
//     var response = await client.post(url, headers: {}, body: data);
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);

//       //   setState(() {
//       //       for (var x in body) {
//       //     areas.add(x['area']);
//       //   }
//       //   print("cites $areas");

//       // });

//       // for (var x in body) {
//       //   name.add(x['name']);
//       // }
//       // print("station $name");

//       print("hedhem les devices $body");
//       va
//       return StationModel.fromJson();
//     } else {
//       print("mch bch te5dem ${response.statusCode}");
//     }
//   }
// }
