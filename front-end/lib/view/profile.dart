import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_login.dart';
import 'package:flutter_application_1/service/api_profile.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/view/login.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEditMode = false;
  User? user;
//class Profile extends StatelessWidget {
  String? id;
  String? nom;
  String? prenom;
  String? email;

  bool isSignin = false;

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // id = sharedPreferences.getString("id");
    //nom = sharedPreferences.getString("nom");
    nom = sharedPreferences.getString("nom");
    prenom = sharedPreferences.getString("prenom");
    email = sharedPreferences.getString("email");

    if (prenom != null) {
      setState(() {
        nom = sharedPreferences.getString("nom");
        prenom = sharedPreferences.getString("prenom");
        email = sharedPreferences.getString("email");
        isSignin = true;
      });
    }
  }

  @override
  initState() {
    getToken();
    user = User(email: '', firstName: '', id: '', lastName: '', token: '');

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        user = arguments["model"];
        isEditMode = true;
        setState(() {});
      }
    });
    //id = SharedPref.getToken() as String;
    // TODO: implement initState
    //super.initState();
  }

  TextEditingController _passwordController = TextEditingController();
  bool vis = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        AntDesign.arrowleft,
                        color: Colors.white,
                      ),
                      Icon(
                        AntDesign.logout,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          nom != null
                                              ? Text(
                                                  nom!,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        39, 105, 171, 1),
                                                    fontFamily: 'Nunito',
                                                    fontSize: 20,
                                                  ),
                                                )
                                              : Text("Loading"),
                                        ]),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(children: [
                                          prenom != null
                                              ? Text(
                                                  prenom!,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        39, 105, 171, 1),
                                                    fontFamily: 'Nunito',
                                                    fontSize: 20,
                                                  ),
                                                )
                                              : Text("Loading"),
                                        ]),
                                      ]),

                                  /* Text(
                                      'Jhone Doe',
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 20,
                                      ),
                                    ),*/
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(children: [
                                    email != null
                                        ? Text(
                                            email!,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  39, 105, 171, 1),
                                              fontFamily: 'Nunito',
                                              fontSize: 20,
                                            ),
                                          )
                                        : Text("Loading"),
                                  ]),
                                ]),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 20,
                              child: Icon(
                                AntDesign.setting,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'images/profile.jpg',
                                    width: innerWidth * 0.45,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Edit Password',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: TextFormField(
                                controller: _passwordController,
                                obscureText: vis,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.blue,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(vis
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      vis = !vis;
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                      )),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              onPressed: () {
                                setState(() {
                                  APIServiceProfile.reset(
                                      user!.email, _passwordController.text);

                                  // if (_key.currentState!.validate()) {
                                });
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Profile()),
                                    (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "valider",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ])),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
