import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/njareb/api_service.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:flutter_application_1/model/cite_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class Station extends StatefulWidget {
  Station({Key? key}) : super(key: key);

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  List<CiteModel?> city = [];
  List city0 = [];
  List<Map<String, dynamic>> itms = [];

  Future<List> getCityFromServer0() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    city = (await APIService.getallcites(_sp.getString("id")!))!
        .cast<CiteModel?>();
    return city;
  }

  final formKey = new GlobalKey<FormState>();

  List? _myActivities;

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
          body: Text("Services not enable"))
        ..show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getLatAndLong();
      }
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
    _kGooglePlex = CameraPosition(
      target: LatLng(37.274612, 9.862724),
      zoom: 10.4746,
    );
    setState(() {});
  }

  @override
  void initState() {
    getper();
    getLatAndLong();
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
    super.initState();

    // citeModel = CiteModel(area: '', description: '', id: '');

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
      markerId: MarkerId("1"),
      position: LatLng(37.274612, 9.862724),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            _kGooglePlex == null
                ? CircularProgressIndicator()
                : Container(
                    child: GoogleMap(
                      markers: mymarker,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex!,
                      onTap: (LatLng latlong) {
                        mymarker.remove(Marker(markerId: MarkerId("1")));
                        mymarker.add(Marker(
                          markerId: MarkerId("1"),
                          position: latlong,
                        ));
                        print('our location : $latlong');
                        setState(() {});
                        // print('our location : $latlong');
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    height: 400,
                    width: 400,
                  ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                    child: ProgressHUD(
                        inAsyncCall: isAPICallProcess,
                        opacity: .3,
                        key: UniqueKey(),
                        child: Column(
                          children: [
                            Form(
                              key: globalKey,
                              child: stationForm(),
                            )
                          ],
                        )))
              ],
            )
          ]),
        ));
  }

  Widget stationForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "area",
              "name station",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'name station is not empty';
                }

                return null;
              },
              (onSavedVal) {
                citeModel!.area = onSavedVal;
              },
              // initialValue: citeModel!.area,
              borderColor: Colors.black,
              borderFocusColor: Colors.black,
              textColor: Colors.black.withOpacity(.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "description",
              "description station ",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'dascription station  is not empty';
                }

                return null;
              },
              (onSavedVal) {
                citeModel!.description = onSavedVal;
              },
              // initialValue: citeModel!.description,
              borderColor: Colors.black,
              borderFocusColor: Colors.black,
              textColor: Colors.black.withOpacity(.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    style: TextStyle(fontSize: 10, color: Colors.black),
                    labelText: 'Select site',
                    items: itms,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                ),
                /*  Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivitiesResult),
             ) */
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RaisedButton(
                onPressed: () async {
                  setState(() {
                    /*isAPICallProcess = true;
                  LatLng latLng = LatLng(lat, long);
                  var xy =
                      await gmc?.getLatLng(ScreenCoordinate(x: lat, y: long));
                  print("*****************************");
                  print(xy);*/
                  });
                  if (validateAndSave()) {
                    // setState(() async {
                    isAPICallProcess = true;
                    //// LatLng latLng = LatLng(lat, long);
                    var xy =
                        await gmc?.getLatLng(ScreenCoordinate(x: lat, y: long));
                    print("*****************************");
                    print(xy);
                    // });
                    /*  APIService.saveCite(citeModel!, isEditMode).then(
                      (Response) {
                        setState(() {
                          isAPICallProcess = false;
                        });

                        if (Response) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'listCite', (route) => false);
                        } else {
                          FormHelper.showSimpleAlertDialog(
                              context, Config.appName, "Error Occure", "ok",
                              () {
                            Navigator.of(context).pop();
                          });
                        }
                      },
                    );*/
                  }
                },
                /* btnColor: HexColor("#283B71"),
                borderColor: Colors.white,
                borderRadius: 10,*/
                child: Text("save")),
          )
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
