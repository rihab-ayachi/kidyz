import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/async.dart';

import 'package:flutter_application_1/njareb/api_service.dart';

import 'package:flutter_application_1/njareb/citeitem.dart';
import 'package:flutter_application_1/view/Site.dart';

import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class CiteList extends StatefulWidget {
  CiteList({Key? key}) : super(key: key);

  @override
  _CiteListState createState() => _CiteListState();
}

class _CiteListState extends State<CiteList> {
  List<CiteModel> cites = List<CiteModel>.empty(growable: true);

  APIService apiService = APIService();
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

  Widget ListCite(cites) {
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
                  itemCount: cites.length,
                  itemBuilder: (context, index) {
                    return Citeitem(
                      model: cites[index],
                      onDelete: (CiteModel model) {},
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
      body: loadCites(), //(cites),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "AddSite");
          // Add your onPressed code here!
        },
        label: Text('Add Site'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Widget loadCites() {
    return FutureBuilder(
        future: APIService.getallcites(""),
        builder: (BuildContext context, AsyncSnapshot<List<CiteModel>?> model) {
          if (model.hasData) {
            return ListCite(model.data);
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
