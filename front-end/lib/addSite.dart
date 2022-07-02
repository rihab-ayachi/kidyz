import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_application_1/view/homePage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSite extends StatefulWidget {
  AddSite({Key? key}) : super(key: key);

  @override
  State<AddSite> createState() => _AddSiteState();
}

class _AddSiteState extends State<AddSite> {
  bool _isLoading = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool vis = true;
  final _globalKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();

  String errorText = '';
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:
            //decoration: new BoxDecoration(color: Color.fromARGB(255, 145, 176, 202)),

            /*image: DecorationImage(
              image: AssetImage('images/image.jpg'), fit: BoxFit.cover)),*/
            Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Add a new site",
                              style: GoogleFonts.pacifico(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Color.fromARGB(255, 224, 169, 200),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(children: [
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: TextField(
                                        controller: _nameController,
                                        decoration: InputDecoration(
                                          hintText: "Site name",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: TextField(
                                        controller: _descriptionController,
                                        decoration: InputDecoration(
                                          hintText: " Site description",
                                        ),
                                      ),
                                    ),
                                  ]))),
                          SizedBox(
                            height: 20,
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
                                    color: Color.fromARGB(255, 224, 169, 200),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    color: Color.fromARGB(255, 224, 169, 200),
                                    onPressed: (() {}),
                                    child: Text("save"),
                                  )
                                ],
                              ))
                        ]))));
  }
}
