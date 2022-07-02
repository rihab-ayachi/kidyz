import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/njareb/api_service.dart';
import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Citeitem extends StatefulWidget {
  const Citeitem({Key? key, this.model, this.onDelete}) : super(key: key);

  final CiteModel? model;
  final Function? onDelete;

  @override
  State<Citeitem> createState() => _CiteitemState();
}

class _CiteitemState extends State<Citeitem> {
  List<CiteModel?> city = [];
  void getCityFromServer() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    city = (await APIService.getallcites(_sp.getString("id")!))!;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: citeWidget(context)));
  }

  Widget citeWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(top: 50, bottom: 50, left: 10)),
        //Container(width: 120,alignment: Alignment.center,)
        Text(
          widget.model!.area!,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.model!.description!,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        /* SizedBox(
          width: 10,
        ),
        Text(
          widget.model!.lattitude!.toString(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.model!.longitude!.toString(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.model!.userid!.toString(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),*/

        Padding(
            padding: EdgeInsets.only(left: 100),
            // width: MediaQuery.of(context).size.width - 200,
            child: Container(
              //width: MediaQuery.of(context).size.width - 200,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                  child: Icon(Icons.edit, color: Colors.blue),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/CiteAdd',
                      arguments: {'model': widget.model},
                    );
                  },
                ),
                GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () {
                    widget.onDelete!(widget.model);
                  },
                ),
              ]),
            ))
      ],
    );
  }
}
