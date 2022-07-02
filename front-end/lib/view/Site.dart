// import "dart:async";

// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';

// /*import 'package:flutter_application_1/network.dart';
// import 'package:flutter_application_1/homePage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:google_fonts/google_fonts.dart';*/
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:snippet_coder_utils/ProgressHUD.dart';

// import 'package:flutter_application_1/njareb/api_service.dart';
// import 'package:flutter_application_1/model/cite_model.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:http/http.dart';
// import 'package:snippet_coder_utils/hex_color.dart';

// //import 'config.dart';
// //import 'njareb/api_service.dart';

// //AIzaSyD3OR9D262aYgz3XfcFQgdT_d93ICgW8rY
// class Site extends StatefulWidget {
//   Site({Key? key}) : super(key: key);

//   @override
//   State<Site> createState() => _SiteState();
// }

// class _SiteState extends State<Site> {
// //ADD CITE //

//   final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   bool isAPICallProcess = false;
//   CiteModel? citeModel;
//   bool isEditMode = false;

//   late Position cl;
//   var lat;
//   var long;
//   CameraPosition? _kGooglePlex;

//   Future getper() async {
//     bool services;
//     LocationPermission per;
//     services = await Geolocator.isLocationServiceEnabled();
//     if (services == false) {
//       AwesomeDialog(
//           context: context,
//           title: "services",
//           body: Text("Services not enable"))
//         ..show();
//     }
//     per = await Geolocator.checkPermission();
//     if (per == LocationPermission.denied) {
//       per = await Geolocator.requestPermission();
//       setState(() {
//         if (per == LocationPermission.always) {
//           getLatAndLong();
//         }
//       });
//     }
//     print("===============");
//     print(per);
//     print("===============");
//     return per;
//   }

//   Future<void> getLatAndLong() async {
//     cl = await Geolocator.getCurrentPosition().then((value) => value);
//     lat = cl.latitude;
//     long = cl.longitude;
//     _kGooglePlex = CameraPosition(
//       target: LatLng(37.274612, 9.862724),
//       zoom: 10.4746,
//     );
//     setState(() {});
//   }

//   @override
//   void initState() {
//     getper();
//     getLatAndLong();
//     super.initState();

//     super.initState();
//     citeModel = CiteModel(area: '', description: '', id: '');

//     Future.delayed(Duration.zero, () {
//       if (ModalRoute.of(context)?.settings.arguments != null) {
//         final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

//         citeModel = arguments["model"];
//         isEditMode = true;
//         setState(() {});
//       }
//     });
//   }

//   GoogleMapController? gmc;

//   Completer<GoogleMapController> _controller = Completer();

//   Set<Marker> mymarker = {
//     Marker(
//       onTap: () {},
//       draggable: true,
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       markerId: MarkerId("1"),
//       position: LatLng(37.274612, 9.862724),
//     ),
//   };

//   /* static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );*/

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             _kGooglePlex == null
//                 ? CircularProgressIndicator()
//                 : Container(
//                     child: GoogleMap(
//                       markers: mymarker,
//                       mapType: MapType.normal,
//                       initialCameraPosition: _kGooglePlex!,
//                       onTap: (LatLng latlong) {
//                         mymarker.remove(Marker(markerId: MarkerId("1")));
//                         mymarker.add(Marker(
//                           markerId: MarkerId("1"),
//                           position: latlong,
//                         ));
//                         print('our location : $latlong');
//                         setState(() {});
//                         // print('our location : $latlong');
//                       },
//                       onMapCreated: (GoogleMapController controller) {
//                         _controller.complete(controller);
//                       },
//                     ),
//                     height: 400,
//                     width: 400,
//                   ),
//             SizedBox(
//               height: 10,
//             ),
//             Column(
//               children: [
//                 Container(
//                     child: ProgressHUD(
//                         inAsyncCall: isAPICallProcess,
//                         opacity: .3,
//                         key: UniqueKey(),
//                         child: Column(
//                           children: [
//                             Form(
//                               key: globalKey,
//                               child: citeForm(),
//                             )
//                           ],
//                         )))
//               ],
//             )
//           ]),
//         ));
//   }

//   Widget citeForm() {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(bottom: 10, top: 10),
//             child: FormHelper.inputFieldWidget(
              
//               context,
//               // const Icon(Icons.ac_unit),
//               "area",
//               "name Cite",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'namaCiteis not empty';
//                 }

//                 return null;
//               },
//               (onSavedVal) {
//                 citeModel!.area = onSavedVal;
//               },
//               initialValue: citeModel!.area,
//               borderColor: Colors.black,
//               borderFocusColor: Colors.black,
//               textColor: Colors.black.withOpacity(.7),
//               borderRadius: 10,
//               showPrefixIcon: false,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 10, top: 10),
//             child: FormHelper.inputFieldWidget(
//               context,
//               // const Icon(Icons.ac_unit),
//               "description",
//               "description Cite",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'nam Cite is not empty';
//                 }

//                 return null;
//               },
//               (onSavedVal) {
//                 citeModel!.description = onSavedVal;
//               },
//               initialValue: citeModel!.description,
//               borderColor: Colors.black,
//               borderFocusColor: Colors.black,
//               textColor: Colors.black.withOpacity(.7),
//               borderRadius: 10,
//               showPrefixIcon: false,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: RaisedButton(
//                 onPressed: () async {
//                   setState(() {
//                     /*isAPICallProcess = true;
//                   LatLng latLng = LatLng(lat, long);
//                   var xy =
//                       await gmc?.getLatLng(ScreenCoordinate(x: lat, y: long));
//                   print("*****************************");
//                   print(xy);*/
//                   });
//                   if (validateAndSave()) {
//                     // setState(() async {
//                     isAPICallProcess = true;
//                     //// LatLng latLng = LatLng(lat, long);
//                     var xy =
//                         await gmc?.getLatLng(ScreenCoordinate(x: lat, y: long));
//                     print("*****************************");
//                     print(xy);
//                     // });
//                       APIService.saveCite(citeModel!, isEditMode).then(
//                       (Response) {
//                         setState(() {
//                           isAPICallProcess = false;
//                         });

//                         if (Response) {
//                           Navigator.pushNamedAndRemoveUntil(
//                               context, 'listCite', (route) => false);
//                         } else {
//                           FormHelper.showSimpleAlertDialog(
//                               context, Config.appName, "Error Occure", "ok",
//                               () {
//                             Navigator.of(context).pop();
//                           });
//                         }
//                       },
//                     );
//                   }
//                 },
//                 /* btnColor: HexColor("#283B71"),
//                 borderColor: Colors.white,
//                 borderRadius: 10,*/
//                 child: Text("save")),
//           )
//         ],
//       ),
//     );
//   }

//   bool validateAndSave() {
//     final form = globalKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
// }
//     //decoration: new BoxDecoration(color: Color.fromARGB(255, 145, 176, 202)),

//     /*image: DecorationImage(
//               image: AssetImage('images/image.jpg'), fit: BoxFit.cover)),*/
//      Center(
//           child: Container(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text("Add a new site",
//                         style: GoogleFonts.pacifico(
//                           fontWeight: FontWeight.normal,
//                           fontSize: 15,
//                           color: Color.fromARGB(255, 224, 169, 200),
//                         )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Container(
//                             height: 200,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Column(children: [
//                               Padding(
//                                 padding: EdgeInsets.all(20),
//                                 child: TextField(
//                                   controller: _nameController,
//                                   decoration: InputDecoration(
//                                     hintText: "Site name",
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(20),
//                                 child: TextField(
//                                   controller: _descriptionController,
//                                   decoration: InputDecoration(
//                                     hintText: " Site description",
//                                   ),
//                                 ),
//                               ),
//                             ]))),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Row(
//                           children: [
//                             RaisedButton(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16)),
//                               onPressed: (() {}),
//                               child: Text("back"),
//                               color: Color.fromARGB(255, 224, 169, 200),
//                             ),
//                             SizedBox(
//                               width: 120,
//                             ),
//                             RaisedButton(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16)),
//                               color: Color.fromARGB(255, 224, 169, 200),
//                               onPressed: (() {}),
//                               child: Text("save"),
//                             )
//                           ],
//                         )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10),
//                     )
//                   ])))
//     ]));*/
//  /* }
// }*/
//         // AIzaSyCYxxzH13BkGspR4Pw0xlAL7lNjnPbjQU4
