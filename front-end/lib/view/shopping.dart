import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/model/products.dart';
import 'package:flutter_application_1/view/Publier.dart';
import 'package:flutter_application_1/view/accueil.dart';
import 'package:flutter_application_1/view/detail_shopping.dart';
import 'package:flutter_application_1/view/item_shopping.dart';
import 'package:flutter_application_1/view/itemcard.dart';
import 'package:flutter_application_1/view/profile.dart';

class Shopping extends StatefulWidget {
  const Shopping({
    Key? key,
  }) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<Product> cites = List<Product>.empty(growable: true);
  bool isAPICallProcess = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              color: Colors.pink[100],
              width: double.infinity,
              height: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Padding(padding: EdgeInsets.all(20)),
                        ElevatedButton(
                            child: Text(
                              "Achat",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigo[400],
                                // onPrimary: Colors.indigo[400],
                                elevation: 0),
                            onPressed: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        ElevatedButton(
                            child: Text("Vente",
                                style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(color: Colors.white),
                                primary: Colors.blueGrey[50],
                                onPrimary: Colors.indigo[400],
                                elevation: 0),
                            onPressed: () {}),
                      ],
                    ),
                  ])),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            separatorBuilder: (context, i) {
              return Divider(color: Colors.black38, height: 1, thickness: 1);
            },
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ItemShopping(
                item: products[index],
                // press: () => Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         DetailShopping(product: products[index])))
              );
            },
          )
        ])),
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
                        primary: Colors.pink[100],
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
