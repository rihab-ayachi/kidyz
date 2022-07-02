import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/model/station_model.dart';
import 'package:flutter_application_1/njareb/api_service.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:flutter_application_1/service/api_station.dart';
import 'package:flutter_application_1/view/login.dart';
import 'package:flutter_application_1/view/profile.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:flutter_application_1/njareb/cite_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [HomePage(), Profile()];
  void _onPageChanged(int index) {
    int _selectIndex = 0;
    setState(() {
      _selectIndex = index;
    });
  }

  void _onItemTapped(int selectIndex) {
    _pageController.jumpToPage(selectIndex);
  }

  late final CiteModel? model;
  String? id;
  String? nom;
  String? prenom;
  String? email;

  bool isSignin = false;

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // id = sharedPreferences.getString("id");
    //nom = sharedPreferences.getString("nom");
    prenom = sharedPreferences.getString("prenom");
    email = sharedPreferences.getString("email");

    if (prenom != null) {
      setState(() {
        prenom = sharedPreferences.getString("prenom");
        email = sharedPreferences.getString("email");
        isSignin = true;
      });
    }
  }

  @override
  initState() {
    getToken();
    getCityFromServer0().then((value) => {
          city0 = value,
          print('//////// ${city0.length}'),
          setState(() {
            itms = city0.map((e) {
              return {
                'value': e!.area,
                'label': e!.area,
              };
            }).toList();
          })
        });
    print("++++++++++++++++++++++++++++${city.length}");

    getStationFromServer0().then((value) => {
          station0 = value,
          print('//////// ${station0.length}'),
          setState(() {
            itmms = station0.map((e) {
              return {
                'value': e!.name,
                'label': e!.name,
              };
            }).toList();
          })
        });
    print("++++++++++++++++++++++++++++${station.length}");
    //getCityFromServer();
    // getCityFromServer0()
    //     .then((value) => {city0 = value, print('//////// ${city0.length}')});
    // print("++++++++++++++++++++++++++++${city.length}");
    // print("++++++++++++++++++++++++++++$city");

    //id = SharedPref.getToken() as String;
    // TODO: implement initState
    super.initState();
  }

  final formKey = new GlobalKey<FormState>();
  final formKeey = new GlobalKey<FormState>();
  List<CiteModel?> city = [];
  List city0 = [];
  List<Map<String, dynamic>> itms = [];

  List<StationModel?> station = [];
  List station0 = [];
  List<Map<String, dynamic>> itmms = [];

  // void getCityFromServer() async {
  //   SharedPreferences _sp = await SharedPreferences.getInstance();
  //   city = (await APIService.getallcites(_sp.getString("id")!))!;
  //   print('///////////////////${city.length}');
  //   print('/////////$city');
  // }

  Future<List> getCityFromServer0() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    city = (await APIService.getallcites(_sp.getString("id")!))!;
    return city;
  }

  Future<List> getStationFromServer0() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    station = (await APIServiceStation.getallstations(_sp.getString("id")!))!;
    // station = (await APIServiceStation.getallstations(_sp.getString("id")!))!

    return station;
  }

  // final List<Map<String, dynamic>> _items = [
  //   {'value': 'val 1'},
  //   {'value': 'val 2'},
  //   {'value': 'val 3'},
  // ];
  // void area() {
  //   for (var i = 0; i < APIService.areas.length; i++) {
  //     _items.add({
  //       'value': APIService.areas[i].toString(),
  //       // 'label': APIService.areas[i],
  //       // 'icon': Icon(Icons.stop),
  //     });
  //     print("***************************************************** $_items");
  //   }
  // }

  List? _myActivities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: prenom != null ? Text(prenom!) : Text("Loading"),
              accountEmail: isSignin ? Text(email!) : Text(""),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("images/rih.jpg"), fit: BoxFit.cover)
                  // borderRadius: BorderRadius.circular(50)
                  ),
            ),
            ListTile(
              title: Text(
                "page home",
                style: TextStyle(color: Color.fromARGB(255, 39, 37, 37)),
              ),
              leading: Icon(Icons.home, color: Colors.blue, size: 25),
              onTap: () {},
            ),
            ListTile(
              title: Text("site"),
              leading: Icon(
                Icons.map,
                color: Colors.blue,
                size: 25,
              ),
              onTap: () {
                Navigator.of(context).pushNamed("/CitList");
              },
            ),
            ListTile(
              title: Text("station"),
              leading: Icon(Icons.home, color: Colors.blue, size: 25),
              onTap: () {
                Navigator.of(context).pushNamed("/StationList");
              },
            ),
            ListTile(
              title: Text("device"),
              leading: Icon(Icons.sensors, color: Colors.blue, size: 25),
              onTap: () {
                Navigator.of(context).pushNamed("Sensor");
              },
            ),
            ListTile(
              title: Text("alert"),
              leading:
                  Icon(Icons.alternate_email, color: Colors.blue, size: 25),
              onTap: () {
                Navigator.of(context).pushNamed("Alert");
              },
            ),
            ListTile(
              title: Text("licence"),
              leading:
                  Icon(Icons.alternate_email, color: Colors.blue, size: 25),
              onTap: () {
                Navigator.of(context).pushNamed("Licence");
              },
            ),
            ListTile(
              title: Text("Logout"),
              leading:
                  Icon(Icons.power_settings_new, color: Colors.blue, size: 25),
              onTap: logout,
            ),
          ],
        ),
      ),

      /*ListTile(
              title: Text(
                "all the post",
              ),
              trailing: Icon(Icons.launch),
              onTap: () {},
            ),
            ListTile(
              title: Text("New Story"),
              trailing: Icon(Icons.add),
              onTap: () {},
            ),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text("Feedback"),
              trailing: Icon(Icons.feedback),
              onTap: () {},
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.power_settings_new),
              onTap: logout,
            ),
          ],
        ),
      ),*/
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              padding: EdgeInsets.only(left: 0),
              height: 100,
              width: 150,
              child: SelectFormField(
                type: SelectFormFieldType.dropdown,
                style: TextStyle(fontSize: 10, color: Colors.black),
                labelText: 'Select site',
                items: itms,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Container(
              //padding: EdgeInsets.only(left: 0),
              height: 100,
              width: 150,
              child: SelectFormField(
                type: SelectFormFieldType.dropdown,
                style: TextStyle(fontSize: 10, color: Colors.black),
                labelText: 'Select station',
                items: itmms,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  color: Color.fromARGB(255, 183, 188, 197),
                  height: 150,
                  width: 150,
                  child: ListTile(
                      title: Row(children: [
                        Container(
                          child: Image.asset(
                            "images/sensor.jpg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("${city.length} Sensors "),
                        )
                      ]),
                      subtitle: Container(
                          child: Center(
                        child: Text("Libelium Smart Environment PRO Model"),
                      ))),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  color: Color.fromARGB(255, 183, 188, 197),
                  height: 150,
                  width: 150,
                  child: ListTile(
                      title: Row(children: [
                        Container(
                          child: Image.asset(
                            "images/site.jpg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("${city.length} Sites"),
                        )
                      ]),
                      subtitle: Container(
                          child: Center(
                        child: Text("Informations depends from Site to Site"),
                      ))),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  color: Color.fromARGB(255, 183, 188, 197),
                  height: 150,
                  width: 150,
                  child: ListTile(
                      title: Row(children: [
                        Container(
                          child: Image.asset(
                            "images/station.jpg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("${station.length} Stations "),
                        )
                      ]),
                      subtitle: Container(
                          child: Center(
                        child: Text("Every Station is affiliated to a Site"),
                      ))),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Forcast")],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Image.asset(
                  "images/Fewclouds.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(children: [
                Text("precipitation : "),
                Text("humidiy : "),
                Text("windspeed :")
              ]),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text("Station : "),
                  Text("Date"),
                  Text("Friday 00:00"),
                  Text("Clear , clear sky")
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text("Temperature"),
              Text("Vent"),
              Text("Précipitation"),
              Text("Humidity"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 2.5,
          ),
          SizedBox(
            height: 30,
          ),
          // Container(
          //   child: DropdownButton(
          //     value: e,
          //     // icon: Icon(Icons.local_hotel),

          //     style: TextStyle(fontSize: 10, color: Colors.black),
          //     items: APIService.areas.map((e) {
          //       return DropdownMenuItem(
          //         child: Text(e),
          //         value: e,
          //       );
          //     }).toList(),
          //     onChanged: (e) => print(e),
          //     // onSaved: (val) => print(val),
          //   ),
          // )
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   onTap: _onItemTapped,
      //  // currentIndex: _selectIndex,
      //   selectedItemColor: Colors.blue[700],
      //   selectedFontSize: 13,
      //   unselectedFontSize: 13,
      //   iconSize: 30,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.home, color: _selectIndex,),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.mail),
      //       label: 'Messages',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     )
      //   ],
      // ),

      /*Wrap(
        children: [
          Card(
            
            margin: EdgeInsets.only(left: 10, right: 200),
            child: ListTile(
              title: Text(
                "Codesinsider.com",
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.green,
          ),

          Card(
            margin: EdgeInsets.only(left: 10, right: 200),
            child: ListTile(
              title: Text(
                "Codesinsider.com",
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.green,
          ),
        ],
      ),*/
    );
  }

  void logout() async {
    Navigator.of(context).pushNamed("login");
  }
}
