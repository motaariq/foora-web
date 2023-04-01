class UserModel {
  bool? success;
  UserData? data;
  String? message;

  UserModel({this.success, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null && json['data'].isNotEmpty ?  UserData.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class UserData {
  String? token;
  String? name;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
  }
}
