import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Publier.dart';
import 'package:flutter_application_1/view/accueil.dart';
import 'package:flutter_application_1/view/categories.dart';
import 'package:flutter_application_1/view/profile.dart';
import 'package:flutter_application_1/view/shopping.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:select_form_field/select_form_field.dart';

class Categorie1 extends StatefulWidget {
  Categorie1({Key? key}) : super(key: key);

  @override
  State<Categorie1> createState() => _Categorie1State();
}

class _Categorie1State extends State<Categorie1> {
  PageController _pageController = PageController();
  // List<Widget> _screens = [Categories(), Shopping(), Publier(), Profile()];
  // int _selectIndex = 0;
  // void _onPageChanged(int index) {
  //   setState(() {
  //     _selectIndex = index;
  //   });
  // }

  // void _onItemTapped(int selectIndex) {
  //   _pageController.jumpToPage(selectIndex);
  // }

  bool status = false;

  bool isToggled = false;
  List choix = [
    {"name": "Enfant 0-3"},
    {"name": "Enfant 4-12"},
    {"name": "Accueil"},
  ];
  // List<Map<String, dynamic>> categoriesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        body: Column(children: [
          Container(
              color: Colors.pink[100],
              width: double.infinity,
              height: 150,
              child: Column(children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                Image(
                  image: AssetImage(
                    "images/logo.png",
                  ),
                  alignment: Alignment.center,
                  width: 180,
                  height: 50,
                ),
                Padding(padding: EdgeInsets.only(left: 0, top: 20)),
                Text(
                  "Choisissez votre catégorie",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ])),
          Container(
              color: Colors.pink[100],
              width: double.infinity,
              height: 100,
              child: Container(
                  width: 80,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0, bottom: 50, left: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/Categories");
                          Color:
                          Color.fromARGB(255, 36, 180, 190);
                        },
                        child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                "Enfant 0-3",
                                style: TextStyle(color: Colors.black38),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 50, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/Categorie1");
                          Color:
                          Color.fromARGB(255, 36, 180, 190);
                        },
                        child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 36, 180, 190),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                "Enfant 4-12",
                                style: TextStyle(color: Colors.black38),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 50, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/Categorie2");
                          Color:
                          Color.fromARGB(255, 36, 180, 190);
                        },
                        child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                "Accessoires",
                                style: TextStyle(color: Colors.black38),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 50, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/Categorie2");
                          Color:
                          Color.fromARGB(255, 36, 180, 190);
                        },
                        child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                "Jeux",
                                style: TextStyle(color: Colors.black38),
                              ),
                            )),
                      ),
                    ),
                  ]))),
          // .builder(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: choix.length,
          //     itemBuilder: (context, i) {
          //       return Container(
          //           width: 10,
          //           height: 20,
          //           // padding:
          //           //     EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //           margin: EdgeInsets.symmetric(
          //             horizontal: 5,
          //           ),

          SizedBox(
            height: 20,
          ),

          //padding: EdgeInsets.only(top: 20),

          // ListView(children: [
          ListTile(
              title: Text("Filles"), trailing: Icon(Icons.play_arrow_rounded)),
          Divider(color: Colors.black38, height: 1, thickness: 1),
          ListTile(
              title: Text("Garçons"), trailing: Icon(Icons.play_arrow_rounded))
        ]
            // .separated(
            //   separatorBuilder: (context, i) {
            //     return Divider(color: Colors.black45, height: 2, thickness: 2);
            //   },
            //   itemCount: 2,
            //   itemBuilder: (context, int i) {
            //     return ListTile(
            //         title: Text("${choix[i]['name']}"), trailing: Icon(Icons.home));
            //   },
            ),

        //         color: Colors.pink[100],
        //         height: 100,
        //         child: Row(
        //           children: [
        //             RaisedButton(
        //               onPressed: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => Categories(),
        //                   ),
        //                 );
        //               },
        //               child: const Text('Enfant 0.3ans',
        //                   style: TextStyle(fontSize: 20)),
        //               color: Color.fromARGB(255, 93, 206, 226),
        //               textColor: Colors.white,
        //               elevation: 5,
        //             ),
        //             RaisedButton(
        //               onPressed: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => Categories(),
        //                   ),
        //                 );
        //               },
        //               child: const Text('Enfant 4.12ans',
        //                   style: TextStyle(fontSize: 20)),
        //               color: Colors.white10,
        //               textColor: Colors.white,
        //               elevation: 5,
        //             ),
        //           ],
        //         )),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     SelectFormField(
        //         type: SelectFormFieldType.dropdown, // or can be dialog
        //         initialValue: '',
        //         style: TextStyle(color: Colors.black54),
        //         textAlign: TextAlign.center,
        //         labelText: 'Files',
        //         items: categoriesList,
        //         onChanged: (val) => {},
        //         onSaved: (val) => {}),
        //     SelectFormField(
        //         type: SelectFormFieldType.dropdown, // or can be dialog
        //         initialValue: '',
        //         labelText: 'Garçons',
        //         items: categoriesList,
        //         onChanged: (val) => {},
        //         onSaved: (val) => {}),
        //   ],
        // ),

        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 100,
                color: Colors.indigo[400],
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.pink[100],
                        textStyle: const TextStyle(fontSize: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Accueil()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text("Accueil")),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Shopping()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text("Shopping")),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Publier()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text("Publier")),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Profile()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text("Profil")),

                  //  TextButton(
                  //   style: TextButton.styleFrom(
                  //     padding: const EdgeInsets.all(16.0),
                  //     primary: Colors.white,
                  //     textStyle: const TextStyle(fontSize: 20),
                  //   ),
                  //   onPressed: () {},
                  //  )
                ]))));
  }
}
