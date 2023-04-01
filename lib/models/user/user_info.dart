class UserInfo {
  bool? success;
  UserInfoData? data;
  String? message;

  UserInfo({this.success, this.data, this.message});

  UserInfo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  UserInfoData.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class UserInfoData {
  String? name;
  String? email;
  String? age;
  String? height;
  String? weight;
  String? phone;
  String? image;

  UserInfoData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    image = json['image'];
    phone = json['phone'];
  }
}
