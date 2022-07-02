import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/async.dart';

import 'package:flutter_application_1/service/api_station.dart';

import 'package:flutter_application_1/view/station/stationitem.dart';
import 'package:flutter_application_1/view/station.dart';

import 'package:flutter_application_1/model/station_model.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class SensorList extends StatefulWidget {
  SensorList({Key? key}) : super(key: key);

  @override
  _SensorListState createState() => _SensorListState();
}

class _SensorListState extends State<SensorList> {
  List<StationModel> cites = List<StationModel>.empty(growable: true);

  // int count = cites.length;

  @override
  void initState() {
    // apiService.getallcites();
    super.initState();

    /*cites.add(CiteModel(
        id: "1",
        area: "tunisie",
        description: "charguia",
        lattitude: 1233,
        longitude: 233,
        userid: "hfjf"));

    cites.add(CiteModel(
        id: "2",
        area: "tunisie",
        description: "charguia",
        lattitude: 1233,
        longitude: 233,
        userid: "hfjf"));*/
  }

  Widget ListStation(station) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         onPrimary: Colors.white,
                //         primary: Colors.pink,
                //         minimumSize: const Size(88, 36),
                //         padding: EdgeInsets.symmetric(
                //           horizontal: 16,
                //         ),
                //         shape: RoundedRectangleBorder(
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(10)))),
                //     onPressed: () {
                //       Navigator.pushNamed(context, "Site");
                //     },
                //     child: Text("Add Cite")),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: station.length,
                  itemBuilder: (context, index) {
                    return Stationitem(
                      model: station[index],
                      onDelete: (StationModel model) {},
                    );
                  },
                ),
              ])
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromARGB(255, 236, 231, 231),
      body: loadStation(), //(cites),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "Station");
          // Add your onPressed code here!
        },
        label: const Text('Add Station'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Widget loadStation() {
    return FutureBuilder(
        future: APIServiceStation.getallstations(""),
        builder:
            (BuildContext context, AsyncSnapshot<List<StationModel>?> model) {
          if (model.hasData) {
            return ListStation(model.data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /* future: apiService.getallcites(""),
        builder: (
      BuildContext context,
      AsyncSnapshot<List<CiteModel>> model,
    ) {
      if (model.hasData) {
        return ListCite(model.data);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );*/
        );
  }
}
