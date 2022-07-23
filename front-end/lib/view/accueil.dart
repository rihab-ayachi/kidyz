import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/products.dart';
import 'package:flutter_application_1/view/Publier.dart';
import 'package:flutter_application_1/view/itemcard.dart';
import 'package:flutter_application_1/view/logo.dart';
import 'package:flutter_application_1/view/profile.dart';
import 'package:flutter_application_1/view/promo_product.dart';
import 'package:flutter_application_1/view/shopping.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
//
//
//import 'package:footer/footer.dart';

class Accueil extends StatefulWidget {
  Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
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
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
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
                                color: Colors.blueGrey[50],
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
                            Color:
                            Color.fromARGB(255, 36, 180, 190);
                            Navigator.of(context).pushNamed("/Categorie2");
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                ElevatedButton(
                    child: Text(
                      "Nouveaux articles",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[400],
                        //onPrimary: Colors.indigo[400],
                        elevation: 0),
                    onPressed: () {}),
                SizedBox(
                  width: 10,
                ),
                Padding(padding: EdgeInsets.all(20)),
                ElevatedButton(
                    child: Text(
                      "Promos",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                        primary: Colors.white,
                        onPrimary: Colors.indigo[400],
                        elevation: 0),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => PromoPro()),
                          (Route<dynamic> route) => false);
                    }),
              ],
            ),
            SizedBox(height: 0),
            Container(
                child: Expanded(
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    //childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        product: products[index],
                      )),
            ))
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
