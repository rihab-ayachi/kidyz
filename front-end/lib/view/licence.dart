import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/api_licence.dart';
import 'package:google_fonts/google_fonts.dart';

class Licence extends StatefulWidget {
  Licence({Key? key}) : super(key: key);

  @override
  State<Licence> createState() => _LicenceState();
}

class _LicenceState extends State<Licence> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text("Insert your key ",
                style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.blue,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  child: Image.asset(
                    'images/securisé.png',
                    width: 100,
                    height: 100,
                    // width: innerWidth * 0.45,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                        hintText: "",
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    color: Colors.blue,
                                    onPressed: (() {}),
                                    child: Text("save"),
                                  )
                                ]))),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                      ])))
        ]),
      ),
    );
  }
}
