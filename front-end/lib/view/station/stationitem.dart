import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/station_model.dart';
import 'package:flutter_application_1/service/api_station.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Stationitem extends StatefulWidget {
  const Stationitem({Key? key, this.model, this.onDelete}) : super(key: key);

  final StationModel? model;
  final Function? onDelete;

  @override
  State<Stationitem> createState() => _StationitemState();
}

class _StationitemState extends State<Stationitem> {
  List<StationModel?> station = [];
  void getStationFromServer() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    station = (await APIServiceStation.getallstations(_sp.getString("id")!))!;
    // station = (await APIServiceStation.getallstations(_sp.getString("id")!))!;
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
          widget.model!.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.model!.localisation,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.model!.cite,
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
            padding: EdgeInsets.only(right: 60),
            child: Container(
              width: MediaQuery.of(context).size.width - 300,
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
