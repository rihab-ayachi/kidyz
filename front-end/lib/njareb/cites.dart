import 'package:flutter/material.dart';

import 'package:flutter_application_1/njareb/citemodel.dart';
import 'package:flutter_application_1/njareb/api_service.dart';

class Cites extends StatefulWidget {
  Cites({Key? key}) : super(key: key);

  @override
  State<Cites> createState() => _CitesState();
}

class _CitesState extends State<Cites> {
  APIService apiService = APIService();

  List<CiteModel>? ourCite;

  @override
  void initState() {
    // apiService.getallcites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          //  future: apiService.getallcites(),
          builder: (context, snapshot) {
        //if (snapshot.hasData) {
        return ListView.builder(
          itemBuilder: (context, index) {
            CiteModel citemodel = ourCite![index];
            return Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    height: 200,
                    child: Card(
                      child: Row(children: [
                        Column(
                          children: [
                            Text(citemodel.id.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(citemodel.area!),
                            SizedBox(
                              height: 10,
                            ),
                            Text(citemodel.description!),
                            SizedBox(
                              height: 10,
                            ),
                            Text(citemodel.lattitude.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(citemodel.longitude.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(citemodel.userid!),
                          ],
                        )
                      ]),
                    )));
          },
        );
      }
          //}
          ),
    );
  }
}
