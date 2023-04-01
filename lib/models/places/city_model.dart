class CityModel {
  bool? success;
  List<CityData>? data;
  String? message;


  CityModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add( CityData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class CityData {
  int? id;
  String? name;

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
