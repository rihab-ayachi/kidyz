import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/accueil.dart';
import 'package:flutter_application_1/view/categories.dart';
import 'package:flutter_application_1/view/profile.dart';
import 'package:flutter_application_1/view/shopping.dart';
import 'package:select_form_field/select_form_field.dart';

class Publier extends StatefulWidget {
  Publier({Key? key}) : super(key: key);

  @override
  State<Publier> createState() => _PublierState();
}

class _PublierState extends State<Publier> {
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

  List<Map<String, dynamic>> categoriesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Publier un nouvel article',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.pink[100],
          toolbarHeight: 100,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {},
                child: const Text('Ajouter des photos',
                    style: TextStyle(fontSize: 15)),
                color: Colors.white,
                textColor: Colors.black54,
                elevation: 0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {},
              decoration: InputDecoration(
                  hintText: 'Titre ',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.black54)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black54)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {},
              decoration: InputDecoration(
                  hintText: ' Description : ',
                  // enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.zero,
                  //     borderSide: BorderSide(color: Colors.black54)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black54)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red))),
            ),
            ListTile(
                title: Text("Filles"),
                trailing: Icon(Icons.play_arrow_rounded)),
            Divider(color: Colors.black38, height: 1, thickness: 1),
            ListTile(
                title: Text("Garçons"),
                trailing: Icon(Icons.play_arrow_rounded)),
            ListTile(
                title: Text("Filles"),
                trailing: Icon(Icons.play_arrow_rounded)),
            Divider(color: Colors.black38, height: 1, thickness: 1),
            ListTile(
                title: Text("Garçons"),
                trailing: Icon(Icons.play_arrow_rounded)),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                child: const Text('Publier', style: TextStyle(fontSize: 20)),
                color: Colors.green,
                textColor: Colors.white,
                elevation: 5,
              ),
            ),
          ],
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
                        primary: Colors.pink[100],
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
