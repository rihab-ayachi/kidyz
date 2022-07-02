import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/station_model.dart';
import 'package:flutter_application_1/model/station_model.dart';
import 'package:flutter_application_1/model/station_model.dart';
import 'package:flutter_application_1/model/user_login.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:flutter_application_1/service/api_station.dart';
import 'package:flutter_application_1/view/login.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import 'package:flutter_application_1/njareb/api_service.dart';
import 'package:flutter_application_1/model/cite_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class AddStation extends StatefulWidget {
  AddStation({Key? key}) : super(key: key);

  @override
  State<AddStation> createState() => _AddStationState();
}

class _AddStationState extends State<AddStation> {
  List<CiteModel> city = [];
  List<CiteModel> city0 = [];
  List<Map<String, dynamic>> itms = [];
  String? id;
  Future<List<CiteModel>> getCityFromServer0() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    city = (await APIService.getallcites(_sp.getString("id")!))!;
    return city;
  }

  bool isSignin = false;

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // id = sharedPreferences.getString("id");
    //nom = sharedPreferences.getString("nom");

    id = sharedPreferences.getString("id");

    if (id != null) {
      setState(() {
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
  StationModel? stationModel;
  bool isEditMode = false;
  CiteModel? selectedModel;

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

    // stationModel = StationModel(
    //     name: '',
    //     localisation: '',
    //     lattitude: null,
    //     longitude: null,
    //     cite: '',
    //     createdDate: null,
    //     id: '',
    //     userid: '',
    //     sensorIds: []);

    super.initState();
    //  stationModel = StationModel(
    //     name: '',
    //     localisation: '',
    //     cite: '',
    //     lattitude:null ,
    //     longitude: null,
    //     userid: 'id', createdDate: null, id: '', sensorIds: [], v: null,
    //   );

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        stationModel = arguments["model"];
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: SelectFormField(
                type: SelectFormFieldType.dropdown,
                style: TextStyle(fontSize: 10, color: Colors.black),
                labelText: 'Select site',
                items: itms,
                onChanged: (val) {
                  final index =
                      city0.indexWhere((element) => element.area == val);
                  if (index != -1) {
                    selectedModel = city0[index];
                  }
                },
              ),
            ),
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
                      APIServiceStation.addstation(
                          _nameController.text,
                          _descriptionController.text,
                          lat,
                          long,
                          selectedModel?.id ?? stationModel!.userid);
                      // if (_key.currentState!.validate()) {
                    });
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => Login()),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    "Confirm",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )));
  }

  Widget name() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            hintText: 'Station Name',
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
      /*decoration: BoxDecoration(
            color: Colors.grey[500], borderRadius: BorderRadius.circular(16)),
        child: Center(*/
      child: TextFormField(
          controller: _descriptionController,
          /*controller: TextEditingController(text: user.username),
          onChanged: (value) {
            user.username = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter something';
            }
            return null;
          },*/

          decoration: InputDecoration(
            hintText: 'Description Station',
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
