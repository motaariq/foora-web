class GamesModel {
  bool? success;
  List<GameData>? data;
  String? message;

  GamesModel({this.success, this.data, this.message});

  GamesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <GameData>[];
      json['data'].forEach((v) {
        data!.add( GameData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class GameData {
  int? id;
  String? venueName;
  String? phone;
  String? playersNumber;
  int? price;
  String? date;
  String? time;
  String? city;
  String? area;
  UserJoinGameData? user;
  String? location;
  int? joinedPlayersCount;

GameData(
  this.user
);
  GameData.fromJson(Map<String, dynamic> json) {
    id =  json['id'];
    venueName = json['venue_name'];
    phone = json['phone'];
    playersNumber = json['players_number'];
    price = double.parse(json['price']).round();
    date = json['date'];
    time = json['time'];
    city = json['city'];
    area = json['area'];
    user = json['user'] != null ?  UserJoinGameData.fromJson(json['user']) : null;
    location = json['location'];
    joinedPlayersCount = json['joined_players_count'];
  }
}

class UserJoinGameData {
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

  UserJoinGameData(
   {
    this.id,
    this.image,
    this.name,
    this.weight,
    this.height,
    this.age
   }
  );


  UserJoinGameData.fromJson(Map<String, dynamic> json) {
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
