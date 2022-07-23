import 'package:flutter/material.dart';
import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Publier.dart';
import 'package:flutter_application_1/view/accueil.dart';
import 'package:flutter_application_1/view/categories.dart';
import 'package:flutter_application_1/view/shopping.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:select_form_field/select_form_field.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
  List<Map<String, dynamic>> categoriesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profil',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.pink[100],
          toolbarHeight: 100,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleButton(
                      onTap: () => {},
                      tooltip: 'photo',
                      width: 60.0,
                      height: 60.0,
                      borderColor: Colors.black54,
                      borderWidth: 4.0,
                      borderStyle: BorderStyle.solid,
                      backgroundColor: Colors.transparent,
                      child: Text('photo')),
                  SizedBox(
                    height: 1.0,
                    width: 20,
                  ),
                  Icon(Icons.star_outline),
                  Icon(Icons.star_outline),
                  Icon(Icons.star_outline),
                  Icon(Icons.star_outline),
                  Text('ridashop'),
                  SizedBox(
                    height: 1.0,
                    width: 20,
                  ),
                  Text(
                    '0 evaluation',
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                  title: Text("Mes favoris", textAlign: TextAlign.center),
                  trailing: Icon(Icons.play_arrow_rounded)),
              Divider(color: Colors.black38, height: 1, thickness: 1),
              ListTile(
                  title:
                      Text("Mes achats / ventes", textAlign: TextAlign.center),
                  trailing: Icon(Icons.play_arrow_rounded)),
              Divider(color: Colors.black38, height: 1, thickness: 1),
              ListTile(
                  title: Text("Porte monnaie", textAlign: TextAlign.center),
                  trailing: Icon(Icons.play_arrow_rounded)),
              Divider(color: Colors.black38, height: 1, thickness: 1),
              ListTile(
                  title: Text("Mes évaluation", textAlign: TextAlign.center),
                  trailing: Icon(Icons.play_arrow_rounded)),
              Divider(color: Colors.black38, height: 1, thickness: 1),
              ListTile(
                title: Center(
                  child: Row(
                    children: [
                      Text("Mode invisible ", textAlign: TextAlign.center),
                      SizedBox(
                        width: 100,
                      ),
                      FlutterSwitch(
                        disabled: true,
                        height: 30.0,
                        width: 50.0,
                        padding: 4.0,
                        toggleSize: 20.0,
                        borderRadius: 16,
                        activeColor: Colors.green,
                        value: isToggled,
                        onToggle: (value) {},
                      ),
                    ],
                  ),
                ),
              ),

              Divider(color: Colors.black38, height: 1, thickness: 1),
              ListTile(
                  title: Text("Pramétres", textAlign: TextAlign.center),
                  trailing: Icon(Icons.play_arrow_rounded)),
              Divider(color: Colors.black38, height: 1, thickness: 1),
              ListTile(
                  title: Text("Informations", textAlign: TextAlign.center),
                  trailing: Icon(Icons.play_arrow_rounded))
              // SelectFormField(
              //     type: SelectFormFieldType.dropdown, // or can be dialog
              //     initialValue: '',
              //     labelText: 'Mes favoris',
              //     items: categoriesList,
              //     onChanged: (val) => {},
              //     onSaved: (val) => {}),
              // SelectFormField(
              //     type: SelectFormFieldType.dropdown, // or can be dialog
              //     initialValue: '',
              //     labelText: 'Mes achats/vente',
              //     items: categoriesList,
              //     onChanged: (val) => {},
              //     onSaved: (val) => {}),
              // SelectFormField(
              //     type: SelectFormFieldType.dropdown, // or can be dialog
              //     initialValue: '',
              //     labelText: 'Porte monnaie',
              //     items: categoriesList,
              //     onChanged: (val) => {},
              //     onSaved: (val) => {}),
              // SelectFormField(
              //     type: SelectFormFieldType.dropdown, // or can be dialog
              //     initialValue: '',
              //     labelText: 'Mes evaluations',
              //     items: categoriesList,
              //     onChanged: (val) => {},
              //     onSaved: (val) => {}),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text('Mode invisible', textAlign: TextAlign.left),
              //     FlutterSwitch(
              //       height: 30.0,
              //       width: 100.0,
              //       padding: 4.0,
              //       toggleSize: 20.0,
              //       borderRadius: 10.0,
              //       activeColor: Colors.green,
              //       value: isToggled,
              //       onToggle: (value) {},
              //     ),
              //   ],
              // ),
              // SelectFormField(
              //     type: SelectFormFieldType.dropdown, // or can be dialog
              //     initialValue: '',
              //     labelText: 'Parametres',
              //     items: categoriesList,
              //     onChanged: (val) => {},
              //     onSaved: (val) => {}),
              // SelectFormField(
              //     type: SelectFormFieldType.dropdown, // or can be dialog
              //     initialValue: '',
              //     labelText: 'informations',
              //     items: categoriesList,
              //     onChanged: (val) => {},
              //     onSaved: (val) => {}),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 100,
                color: Colors.indigo[400],
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
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
                        primary: Colors.pink[100],
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
                ])))
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: 0,

        //   backgroundColor: Color.fromARGB(
        //       255, 35, 89, 134), // this will be set when a new tab is tapped
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.public), label: 'publier'),
        //     BottomNavigationBarItem(
        //       icon: new Icon(Icons.shopping_cart),
        //       label: 'Shopping',
        //     ),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil')
        //   ],
        // ),
        );
  }
}
// child: Container(
          //   color: Colors.pink[100],
          //   width: double.infinity,
          //   height: 200,
          //   alignment: Alignment.center,
          //   child: Image(
          //     image: AssetImage(
          //       "images/logo.png",
          //     ),
          //     width: 180,
          //     height: 50,
          //   ),
          // ),