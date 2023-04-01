class RequestModel {
  bool? success;
  RequestData? data;
  String? message;

  RequestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  RequestData.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class RequestData {
  String? name;
  String? phone;
  int? playersNumber;
  int? price;
  String? date;
  String? time;
  String? cityId;
  String? areaId;
  String? locationUrl;
  int? type;
  int? userId;

  RequestData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    playersNumber = json['players_number'];
    price = json['price'];
    date = json['date'];
    time = json['time'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    locationUrl = json['location_url'];
    type = json['type'];
    userId = json['user_id'];
  }
}
