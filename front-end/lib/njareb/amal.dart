/*import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:flutter_application_1/njareb/cites.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class getServiceTypes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return getAllServiceTypesState();
  }
}

class getAllServiceTypesState extends State<getServiceTypes> {
  late CiteModel? CiteType;
  getAllServiceTypesState({this.CiteType});

  List<CiteModel> cites = [];
//after feteching from the internet than we will store here in this list
  final String url = "http://192.168.1.49:3008/api/cite/getallcites";
  var client = http.Client();
  bool loading = true;
  Future<List<CiteModel>?> fetchData() async {
    http.Response response = await client.post(
      Uri.parse(url),
      // headers: {"Content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      // Connection Ok
      List responseJson = json.decode(response.body);
      print("hedhem les cites $responseJson");
      responseJson.map((m) => cites.add(CiteModel.fromJson(m))).toList();
      setState(() {
        loading = false;
      });
    } else {
      throw ('error');
    }
  }

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SERVICE'),
        backgroundColor: Colors.purpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
          child: loading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  itemCount: cites.length,
                  itemBuilder: (BuildContext context, int index) {
                    var address = cites[index].area;

                    return Card(
                      child: ListTile(
                        title: Text(address),
                        leading: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            icon: Icon(Icons.category_rounded)),
                      ),
                    );
                  },
                )),
    );
  }
}*/
