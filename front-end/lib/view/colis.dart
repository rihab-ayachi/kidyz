import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/products.dart';
import 'package:flutter_application_1/view/detail_shopping.dart';

class Colis extends StatefulWidget {
  final Product item;
  const Colis({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<Colis> createState() => _ColisState();
}

class _ColisState extends State<Colis> {
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
            child: Column(children: [
              Padding(padding: EdgeInsets.only(top: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/Shopping");
                    },
                  ),
                  //Padding(padding: EdgeInsets.all(20)),
                  ElevatedButton(
                      child: Text(
                        "Message",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[50],
                          //  onPrimary: Colors.indigo[400],
                          elevation: 0),
                      onPressed: () {}),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  ElevatedButton(
                      child: Text("Suivre le colis",
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(color: Colors.white),
                          primary: Colors.indigo[400],
                          //  onPrimary: Colors.indigo[400],
                          elevation: 0),
                      onPressed: () {}),
                ],
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),

          ListTile(
            leading: Image.asset(widget.item.image),
            title: Text(
              "${widget.item.name}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${widget.item.price}€",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // trailing: Text("${widget.item.name}"),
          ),
          Divider(color: Colors.black38, height: 1, thickness: 1),
          SizedBox(
            width: 20,
          ),

          ListTile(
            title: Text(
              "Telecharger les bordereau d'envoi",
              textAlign: TextAlign.center,
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.play_arrow_outlined,
            ),
            Container(
                height: 50,
                width: 250,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  // leading: Icon(
                  //   Icons.play_arrow_outlined,
                  // ),
                  tileColor: Colors.indigo[400],
                  title: Text("Dépot du colis en point relais",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ))
          ]),

          ListTile(
            title: Text(
              "Colis au cours de livraison",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Arrivé du colis au point relais",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Colis récupéré",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Réception validée par l'acheteur",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 90,
            width: 300,
            child: Text(
                "Tansection terminée\n vous allez recevoire votre argent\n dans un bref délai",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black26)),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(20)),
          )
          //   Column(children: [
          //     Text("${widget.item.name}"),
          //     Text("${widget.item.price}")
          //   ]),
          // ])
        ]),
      ),
    );
  }
}
