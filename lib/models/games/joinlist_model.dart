class JoinListModel {
  bool? success;
  List<JoinedGameData>? data;
  String? message;

  JoinListModel({this.success, this.data, this.message});

  JoinListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <JoinedGameData>[];
      json['data'].forEach((v) {
        data!.add( JoinedGameData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class JoinedGameData {
  int? id;
  String? venueName;
  String? phone;
  String? playersNumber;
  String? price;
  String? date;
  String? time;
  String? city;
  String? area;
  Creator? creator;
  String? location;
  String? status;
  JoinedPlayer? player;


  JoinedGameData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueName = json['venue_name'];
    phone = json['phone'];
    playersNumber = json['players_number'];
    price = json['price'];
    date = json['date'];
    time = json['time'];
    city = json['city'];
    area = json['area'];
    creator =
        json['creator'] != null ?  Creator.fromJson(json['creator']) : null;
    location = json['location'];
    status = json['status'];
    player =
        json['player'] != null ?  JoinedPlayer.fromJson(json['player']) : null;
  }
}

class Creator {
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

  Creator.fromJson(Map<String, dynamic> json) {
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

class JoinedPlayer {
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

  JoinedPlayer.fromJson(Map<String, dynamic> json) {
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
