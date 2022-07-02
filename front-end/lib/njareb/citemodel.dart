import 'dart:ffi';

List<CiteModel> citeFormJson(dynamic str) =>
    List<CiteModel>.from((str).map((x) => CiteModel.fromJson(x)));

/*CiteModel serviceModelJson(String str) => CiteModel.fromJson(jsonDecode(str));
String serviceModelToJson(CiteModel data) => jsonEncode(data.toJson());*/

class CiteModel {
  late final String? id;
  late final String? area;
  late final String? description;
  late final double? lattitude;
  late final double? longitude;
  late final String? userid;

  CiteModel({
    required this.id,
    required this.area,
    required this.description,
    required this.lattitude,
    required this.longitude,
    required this.userid,
  });

  factory CiteModel.fromJson(Map<String, dynamic> json) => CiteModel(
      id: json["_id"],
      area: json["area"],
      description: json["description"],
      lattitude: json["lattitude"],
      longitude: json["longitude"],
      userid: json["userid"]);

  /*Map<String, dynamic> toJson() => {
        "_id": id,
        "area": area,
        'description': description,
        'lattitude': lattitude,
        'longitude': longitude,
        'userid': userid
      };*/

  /* CiteModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    area = json["area"];
    description = json["description"];
    lattitude = json["lattitude"];
    longitude = json["longitude"];
    userid = json["userid"];
  }*/

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data["_id"] = id;
    _data["area"] = area;
    _data["description"] = description;
    _data["lattitude"] = lattitude;
    _data["longitude"] = longitude;
    _data["userid"] = userid;

    return _data;
  }

  /*String? get _id => id,

  String? get area => area;
  String? get description => description;*/
}
