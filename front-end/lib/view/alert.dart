import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Alert extends StatefulWidget {
  Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  final formKey = new GlobalKey<FormState>();
  final formKeey = new GlobalKey<FormState>();
  final formKeeey = new GlobalKey<FormState>();
  final formKeeeey = new GlobalKey<FormState>();
  TextEditingController _nomController = TextEditingController();

  List? _myActivities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 5, bottom: 0),
                      child: MultiSelectFormField(
                        autovalidate: AutovalidateMode.disabled,
                        chipBackGroundColor: Colors.blue,
                        chipLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.blue,
                        checkBoxCheckColor: Colors.white,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
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
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 5, bottom: 0),
                      child: MultiSelectFormField(
                        autovalidate: AutovalidateMode.disabled,
                        chipBackGroundColor: Colors.blue,
                        chipLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.blue,
                        checkBoxCheckColor: Colors.white,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "Select Station",
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
              SizedBox(
                height: 10,
              ),
              Text(
                "Once you created an alert on specific sensor, you will get the notification on your email",
                style: GoogleFonts.pacifico(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 218, 61, 139)),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: formKeeey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 5, bottom: 0),
                      child: MultiSelectFormField(
                        autovalidate: AutovalidateMode.disabled,
                        chipBackGroundColor: Colors.blue,
                        chipLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.blue,
                        checkBoxCheckColor: Colors.white,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "Select Sensor",
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
              SizedBox(height: 10),
              alertForm(),
            ],
          ),
        ));
  }

  Widget alertForm() {
    return Column(children: [
      Form(
        key: formKeeeey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 200, top: 5, bottom: 0),
              child: MultiSelectFormField(
                autovalidate: AutovalidateMode.disabled,
                chipBackGroundColor: Colors.blue,
                chipLabelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                checkBoxActiveColor: Colors.blue,
                checkBoxCheckColor: Colors.white,
                dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                title: Text(
                  "Factor",
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
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 200,
          top: 10,
        ),
        child: TextFormField(
            controller: _nomController,
            decoration: InputDecoration(
              hintText: 'Max',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 218, 61, 139)),
              ),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 200,
          top: 10,
        ),
        child: TextFormField(
            controller: _nomController,
            decoration: InputDecoration(
              hintText: 'Min',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 218, 61, 139)),
              ),
            )),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 50,
          width: 400,
          child: RaisedButton(
            color: Color.fromARGB(255, 218, 61, 139),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: () {
              setState(() {});
            },
            child: Text(
              "ADD",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ]);
  }
}
