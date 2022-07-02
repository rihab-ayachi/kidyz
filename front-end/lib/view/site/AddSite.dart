import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_login.dart';
import 'package:flutter_application_1/njareb/cite_list.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:flutter_application_1/view/login.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import 'package:flutter_application_1/njareb/api_service.dart';
import 'package:flutter_application_1/model/cite_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class AddSite extends StatefulWidget {
  AddSite({Key? key}) : super(key: key);

  @override
  State<AddSite> createState() => _AddSiteState();
}

class _AddSiteState extends State<AddSite> {
  String? id;

  bool isSignin = false;

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    id = sharedPreferences.getString("id");

    if (id != null) {
      setState(() {
        id = sharedPreferences.getString("id");
        isSignin = true;
      });
    }
  }

  List latlg = [];
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool isAPICallProcess = false;
  CiteModel? citeModel;
  bool isEditMode = false;

  late Position cl;
  var lat;
  var long;
  CameraPosition? _kGooglePlex;

  Future getper() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
          context: context,
          title: "services",
          body: const Text("Services not enable"))
        ..show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      setState(() {
        if (per == LocationPermission.always) {
          getLatAndLong();
        }
      });
    }
    print("===============");
    print(per);
    print("===============");
    return per;
  }

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    _kGooglePlex = const CameraPosition(
      target: LatLng(37.274612, 9.862724),
      zoom: 10.4746,
    );
    setState(() {});
  }

  @override
  void initState() {
    getToken();
    getper();
    getLatAndLong();
    super.initState();

    super.initState();
    citeModel = CiteModel(
      area: '',
      description: '',
      id: '',
      lattitude: null,
      longitude: null,
      userid: 'id',
    );

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        citeModel = arguments["model"];
        isEditMode = true;
        setState(() {});
      }
    });
  }

  GoogleMapController? gmc;

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> mymarker = {
    Marker(
      onTap: () {},
      draggable: true,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      markerId: const MarkerId("1"),
      position: const LatLng(37.274612, 9.862724),
    )
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            _kGooglePlex == null
                ? const CircularProgressIndicator()
                : Container(
                    child: GoogleMap(
                      markers: mymarker,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex!,
                      onTap: (LatLng latlong) {
                        LatLng latLng = LatLng(lat, long);
                        mymarker.remove(const Marker(markerId: MarkerId("1")));
                        mymarker.add(Marker(
                          markerId: const MarkerId("1"),
                          position: latlong,
                        ));

                        setState(() {});

                        print('our lattitude : $lat');
                        print('our longitude: $long');
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    height: 400,
                    width: 400,
                  ),
            const SizedBox(
              height: 10,
            ),
            name(),
            description(),
            //Column(
            // children: [
            //   Container(
            //       child: ProgressHUD(
            //           inAsyncCall: isAPICallProcess,
            //           opacity: .3,
            //           key: UniqueKey(),
            //           child: Column(
            //             children: [
            //               Form(
            //                 key: globalKey,
            //                 child: name(),

            //               )
            //             ],
            //           ))),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 50,
                width: 400,
                child: FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(52)),
                  onPressed: () async {
                    print(" controller note : ${_nameController.text}");
                    isAPICallProcess = true;
                    //LatLng latLng = LatLng(lat, long);
                    var xy =
                        await gmc?.getLatLng(ScreenCoordinate(x: lat, y: long));
                    print("*****************************");
                    print("$lat");
                    print("$long");

                    setState(() {
                      APIService.addcite(
                          _nameController.text,
                          _descriptionController.text,
                          lat,
                          long,
                          citeModel!.userid!);
                      // if (_key.currentState!.validate()) {
                    });
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => CiteList()),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    "confirm",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )));
  }

  // Widget citeForm() {
  //   return SingleChildScrollView(
  //       child: Column(
  //           // mainAxisAlignment: MainAxisAlignment.start,
  //           // crossAxisAlignment: CrossAxisAlignment.start,
  //           // mainAxisSize: MainAxisSize.min,
  //           children: [
  //         Expanded(
  //             child: Container(
  //           // height: 50,
  //           // width: 360,
  //           padding: EdgeInsets.only(left: 10, right: 10),
  //           child: TextFormField(
  //               controller: _descriptionController,
  //               keyboardType: TextInputType.text,
  //               validator: (val) {
  //                 if (val!.isEmpty) {
  //                   return 'FirstName Empty';
  //                 }
  //                 return null;
  //               },
  //               decoration: InputDecoration(
  //                 hintText: "Site Name",
  //                 // prefixIcon: Icon(
  //                 //   Icons.person,
  //                 //   color: Colors.blue,
  //                 // ),
  //                 enabledBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(16),
  //                     borderSide: BorderSide(color: Colors.blue)),
  //                 focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(16),
  //                     borderSide: BorderSide(color: Colors.blue)),
  //                 //focusedBorder: UnderlineInputBorder(
  //                 //  borderSide: BorderSide(color: Colors.black, width: 2)),
  //               )),
  //         )),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Expanded(
  //             child: Container(
  //                 padding: EdgeInsets.only(left: 10, right: 10),
  //                 // height: 50,
  //                 // width: 400,
  //                 child: TextFormField(
  //                     controller: _nameController,
  //                     keyboardType: TextInputType.text,
  //                     validator: (val) {
  //                       if (val!.isEmpty) {
  //                         return 'FirstName Empty';
  //                       }
  //                       return null;
  //                     },
  //                     decoration: InputDecoration(
  //                       hintText: "Site Description",
  //                       // prefixIcon: Icon(
  //                       //   Icons.person,
  //                       //   color: Colors.blue,
  //                       // ),
  //                       enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(16),
  //                           borderSide: BorderSide(color: Colors.blue)),
  //                       focusedBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(16),
  //                           borderSide: BorderSide(color: Colors.blue)),
  //                       //focusedBorder: UnderlineInputBorder(
  //                       //  borderSide: BorderSide(color: Colors.black, width: 2)),
  //                     ))))
  //       ]));
  // }

  Widget name() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            hintText: 'Site Name',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue)),
          )),
    );
  }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
            hintText: 'Description Site',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue)),
          )),
    );
  }
}
