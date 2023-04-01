
class UserCreatedModel {
  bool? success;
  List<UserCreatedData>? data;
  String? message;

  UserCreatedModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <UserCreatedData>[];
      json['data'].forEach((v) {
        data!.add( UserCreatedData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class UserCreatedData {
  int? id;
  String? venueName;
  String? phone;
  String? playersNumber;
  int? price;
  String? date;
  String? time;
  String? city;
  String? area;
  UserCreated? user;
  String? location;
  int? joinedPlayersCount;

  UserCreatedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueName = json['venue_name'];
    phone = json['phone'];
    playersNumber = json['players_number'];
    price = double.parse(json['price']).round();
    date = json['date'];
    time = json['time'];
    city = json['city'];
    area = json['area'];
    user = json['user'] != null ?  UserCreated.fromJson(json['user']) : null;
    location = json['location'];
    joinedPlayersCount = json['joined_players_count'];
  }
}

class UserCreated {
  int? id;
  String? name;
  String? email;
  String? age;
  String? height;
  String? weight;
  String? image;
  String? phone;
  String? city;
  String? area;

  UserCreated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    image = json['image'];
    phone = json['phone'];
    city = json['city'];
    area = json['area'];
  }
}