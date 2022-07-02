import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/station_model.dart';
import 'package:flutter_application_1/njareb/api_service.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:flutter_application_1/service/api_station.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class AddAdvice extends StatefulWidget {
  AddAdvice({Key? key}) : super(key: key);

  @override
  State<AddAdvice> createState() => _AddAdviceState();
}

class _AddAdviceState extends State<AddAdvice> {
  TextEditingController _nomController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final formKey = new GlobalKey<FormState>();
  final formKeey = new GlobalKey<FormState>();
  @override
  void initState() {
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
    // TODO: implement initState
    super.initState();
  }

  List? _myActivities;
  List<CiteModel?> city = [];
  List city0 = [];
  List<Map<String, dynamic>> itms = [];

  List<StationModel?> station = [];
  List station0 = [];
  List<Map<String, dynamic>> itmms = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sensor")),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: Text("Insert your Sensor ID so we can recognize it !"),
            ),
            Positioned(
              top: 10,
              child: Image.asset(
                "images/sensor.jpg",
                width: 400,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  controller: _nomController,
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
                    hintText: '',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  )),
            ),
            citeForm(),
          ]),
        ));
  }

  Widget citeForm() {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Text(
                "To get global informations about the weather , the temperature , the humidity ,... we use our high tech sensors "
                "Continue with the sensor details")),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Fill with your informations")),
        name(),
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
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
        ),

        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: SelectFormField(
            type: SelectFormFieldType.dropdown,
            style: TextStyle(fontSize: 10, color: Colors.black),
            labelText: 'Select station',
            items: itmms,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
        ),
        description(),

        // Padding(
        //   padding: EdgeInsets.only(bottom: 5, top: 5),
        //   child: FormHelper.inputFieldWidget(
        //     context,
        //     // const Icon(Icons.ac_unit),
        //     "area",
        //     "name station",
        //     (onValidateVal) {
        //       if (onValidateVal.isEmpty) {
        //         return 'name station is not empty';
        //       }

        //       return null;
        //     },
        //     (onSavedVal) {
        //       // citeModel!.area = onSavedVal;
        //     },
        //     // initialValue: citeModel!.area,
        //     borderColor: Colors.black,
        //     borderFocusColor: Colors.black,
        //     textColor: Colors.black.withOpacity(.3),
        //     borderRadius: 10,
        //     showPrefixIcon: false,
        //   ),
        // ),
        // Form(
        //   key: formKey,
        //   child: Column(
        //     children: <Widget>[
        //       Container(
        //         padding:
        //             EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 2),
        //         child: MultiSelectFormField(
        //           autovalidate: AutovalidateMode.disabled,
        //           chipBackGroundColor: Colors.blue,
        //           chipLabelStyle: TextStyle(
        //               fontWeight: FontWeight.bold, color: Colors.white),
        //           dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
        //           checkBoxActiveColor: Colors.blue,
        //           checkBoxCheckColor: Colors.white,
        //           dialogShapeBorder: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(12.0))),
        //           title: Text(
        //             "Select Site",
        //             style: TextStyle(fontSize: 16),
        //           ),
        //           validator: (value) {},
        //           dataSource: [
        //             {
        //               "display": "bizert",
        //               "value": "bizert",
        //             },
        //             {
        //               "display": "tunisie",
        //               "value": "tunisie",
        //             },
        //             {
        //               "display": "Gafsa",
        //               "value": "Gafsa",
        //             },
        //             {
        //               "display": "Mednin",
        //               "value": "Mednin",
        //             },
        //             {
        //               "display": "Jerba",
        //               "value": "Jerba",
        //             },
        //           ],
        //           textField: 'display',
        //           valueField: 'value',
        //           okButtonLabel: 'OK',
        //           cancelButtonLabel: 'CANCEL',
        //           hintWidget: Text(''),
        //           initialValue: _myActivities,
        //           onSaved: (value) {
        //             if (value == null) return;
        //             setState(() {
        //               _myActivities = value;
        //             });
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Form(
        //   key: formKeey,
        //   child: Column(
        //     children: <Widget>[
        //       Container(
        //         padding:
        //             EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 2),
        //         child: MultiSelectFormField(
        //           autovalidate: AutovalidateMode.disabled,
        //           chipBackGroundColor: Colors.blue,
        //           chipLabelStyle: TextStyle(
        //               fontWeight: FontWeight.bold, color: Colors.white),
        //           dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
        //           checkBoxActiveColor: Colors.blue,
        //           checkBoxCheckColor: Colors.white,
        //           dialogShapeBorder: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(12.0))),
        //           title: Text(
        //             "Select Site",
        //             style: TextStyle(fontSize: 16),
        //           ),
        //           validator: (value) {},
        //           dataSource: [
        //             {
        //               "display": "bizert",
        //               "value": "bizert",
        //             },
        //             {
        //               "display": "tunisie",
        //               "value": "tunisie",
        //             },
        //             {
        //               "display": "Gafsa",
        //               "value": "Gafsa",
        //             },
        //             {
        //               "display": "Mednin",
        //               "value": "Mednin",
        //             },
        //             {
        //               "display": "Jerba",
        //               "value": "Jerba",
        //             },
        //           ],
        //           textField: 'display',
        //           valueField: 'value',
        //           okButtonLabel: 'OK',
        //           cancelButtonLabel: 'CANCEL',
        //           hintWidget: Text(''),
        //           initialValue: _myActivities,
        //           onSaved: (value) {
        //             if (value == null) return;
        //             setState(() {
        //               _myActivities = value;
        //             });
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(bottom: 5, top: 5),
        //   child: FormHelper.inputFieldWidget(
        //     context,
        //     // const Icon(Icons.ac_unit),
        //     "area",
        //     "name station",
        //     (onValidateVal) {
        //       if (onValidateVal.isEmpty) {
        //         return 'name station is not empty';
        //       }

        //       return null;
        //     },
        //     (onSavedVal) {
        //       // citeModel!.area = onSavedVal;
        //     },
        //     // initialValue: citeModel!.area,
        //     borderColor: Colors.black,
        //     borderFocusColor: Colors.black,
        //     textColor: Colors.black.withOpacity(.3),
        //     borderRadius: 10,
        //     showPrefixIcon: false,
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            height: 50,
            width: 400,
            child: RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                setState(() {});
              },
              child: Text(
                "Comfirm",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ));
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
