import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Sensor extends StatefulWidget {
  Sensor({Key? key}) : super(key: key);

  @override
  State<Sensor> createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  TextEditingController _nomController = TextEditingController();

  final formKey = new GlobalKey<FormState>();
  final formKeey = new GlobalKey<FormState>();

  List? _myActivities;

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
        Padding(
          padding: EdgeInsets.only(bottom: 5, top: 5),
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
              // citeModel!.area = onSavedVal;
            },
            // initialValue: citeModel!.area,
            borderColor: Colors.black,
            borderFocusColor: Colors.black,
            textColor: Colors.black.withOpacity(.3),
            borderRadius: 10,
            showPrefixIcon: false,
          ),
        ),
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 2),
                child: MultiSelectFormField(
                  autovalidate: AutovalidateMode.disabled,
                  chipBackGroundColor: Colors.blue,
                  chipLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Colors.blue,
                  checkBoxCheckColor: Colors.white,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "Select Site",
                    style: TextStyle(fontSize: 16),
                  ),
                  validator: (value) {},
                  dataSource: [
                    {
                      "display": "bizert",
                      "value": "bizert",
                    },
                    {
                      "display": "tunisie",
                      "value": "tunisie",
                    },
                    {
                      "display": "Gafsa",
                      "value": "Gafsa",
                    },
                    {
                      "display": "Mednin",
                      "value": "Mednin",
                    },
                    {
                      "display": "Jerba",
                      "value": "Jerba",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text(''),
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Form(
          key: formKeey,
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 2),
                child: MultiSelectFormField(
                  autovalidate: AutovalidateMode.disabled,
                  chipBackGroundColor: Colors.blue,
                  chipLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Colors.blue,
                  checkBoxCheckColor: Colors.white,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "Select Site",
                    style: TextStyle(fontSize: 16),
                  ),
                  validator: (value) {},
                  dataSource: [
                    {
                      "display": "bizert",
                      "value": "bizert",
                    },
                    {
                      "display": "tunisie",
                      "value": "tunisie",
                    },
                    {
                      "display": "Gafsa",
                      "value": "Gafsa",
                    },
                    {
                      "display": "Mednin",
                      "value": "Mednin",
                    },
                    {
                      "display": "Jerba",
                      "value": "Jerba",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text(''),
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5, top: 5),
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
              // citeModel!.area = onSavedVal;
            },
            // initialValue: citeModel!.area,
            borderColor: Colors.black,
            borderFocusColor: Colors.black,
            textColor: Colors.black.withOpacity(.3),
            borderRadius: 10,
            showPrefixIcon: false,
          ),
        ),
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
}
