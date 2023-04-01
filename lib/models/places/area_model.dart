class AreaModel {
  bool? success;
  List<AreaData>? data;
  String? message;

  AreaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AreaData>[];
      json['data'].forEach((v) {
        data!.add( AreaData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class AreaData {
  int? id;
  String? name;

  AreaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
