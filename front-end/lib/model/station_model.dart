import 'dart:convert';

// List<StationModel> stationModelFromJson(String str) => List<StationModel>.from(json.decode(str).map((x) => StationModel.fromJson(x)));

// String stationModelToJson(List<StationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
List<StationModel> stationFromJson(dynamic str) =>
    List<StationModel>.from((str).map((x) => StationModel.fromJson(x)));

class StationModel {
  StationModel({
    required this.createdDate,
    required this.cite,
    required this.userid,
    required this.sensorIds,
    required this.id,
    required this.name,
    required this.localisation,
    required this.lattitude,
    required this.longitude,
    //required this.v,
  });

  DateTime createdDate;
  String cite;
  String userid;
  List<String> sensorIds;
  String id;
  String name;
  String localisation;
  double lattitude;
  double longitude;
  //int v;

  factory StationModel.fromJson(Map<String, dynamic> json) => StationModel(
        createdDate: DateTime.parse(json["created_date"]),
        cite: json["cite"],
        userid: json["userid"],
        sensorIds: List<String>.from(json["Sensor_ids"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        localisation: json["localisation"],
        lattitude: json["lattitude"],
        longitude: json["longitude"],
        //  v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "created_date": createdDate.toIso8601String(),
        "cite": cite,
        "userid": userid,
        "Sensor_ids": List<dynamic>.from(sensorIds.map((x) => x)),
        "_id": id,
        "name": name,
        "localisation": localisation,
        "lattitude": lattitude,
        "longitude": longitude,
        // "__v": v,
      };
}
