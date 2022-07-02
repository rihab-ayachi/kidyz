// List<CiteModel> citesFromJson(dynamic str) =>
//     List<CiteModel>.from((str).map((x) => CiteModel.fromJson(x)));

// class CiteModel {
//   late final String id;
//   late final String area;
//   late final String description;
//   late final double lattitude;
//   late final int longitude;
//   late final String userid;

//   CiteModel({
//     required this.id,
//     required this.area,
//     required this.description,
//     required this.lattitude,
//     required this.longitude,
//     required this.userid,
//   });

//   CiteModel.fromJson(Map<String, dynamic> json) {
//     id = json["_id"];
//     area = json["area"];
//     description = json["description"];
//     lattitude = json["lattitude"];
//     longitude = json["longitude"];
//     userid = json["userid"];
//   }

//   Map<String, String> toJson() {
//     final _data = <String, String>{};

//     _data["_id"] = id;
//     _data["area"] = area;
//     _data["description"] = description;
//      _data["lattitude"] = lattitude;
//     _data["longitude"] = longitude;
//     _data["userid"] = userid;

//     return _data;
//   }
// }
