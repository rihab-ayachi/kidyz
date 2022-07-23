import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/chat.dart';
import 'package:flutter_application_1/model/products.dart';
import 'package:flutter_application_1/view/colis.dart';
import 'package:flutter_application_1/view/itemcard.dart';

class DetailShopping extends StatefulWidget {
  final Product item;
  const DetailShopping({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailShopping> createState() => _DetailShoppingState();
}

class _DetailShoppingState extends State<DetailShopping> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Bonjour\n  pouvez vous me faire une remise",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Je vous le laisse à 4€", messageType: "receiver"),
    ChatMessage(messageContent: "Super,merci", messageType: "sender"),
  ];
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
                            primary: Colors.indigo[400],
                            // onPrimary: Colors.indigo[400],
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
                            primary: Colors.blueGrey[50],
                            onPrimary: Colors.indigo[400],
                            elevation: 0),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Colis(
                              item: widget.item,
                            ),
                          ));
                        })
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

            //   Column(children: [
            //     Text("${widget.item.name}"),
            //     Text("${widget.item.price}")
            //   ]),
            // ])

            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 90,
                  width: 100,
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (messages[index].messageType == "receiver"
                            ? Colors.indigo[100]
                            : Colors.indigo[100]),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 100,
                color: Colors.indigo[400],
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                  bottom: 20,
                ),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                    ),
                    // borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'écrivez votre message',
                          enabledBorder: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                          focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                        )

                        // child: ElevatedButton(
                        //     child: Text(
                        //       "écrivez votre message ",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //     style: ElevatedButton.styleFrom(
                        //         padding: EdgeInsets.all(20),
                        //         primary: Color.fromARGB(255, 134, 178, 207),
                        //         minimumSize: Size(50, 20),
                        //         maximumSize: Size(100, 50),
                        //         elevation: 0),
                        //     onPressed: () {}),
                        )))));
  }
}
