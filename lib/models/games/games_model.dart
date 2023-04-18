class GamesModel {
  bool? success;
  List<GameData>? data;
  String? message;

  GamesModel({this.success, this.data, this.message});

  GamesModel.fromJson(Map<dynamic, dynamic> json) {
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
  String? type;
  List<AcceptedPlayers>? acceptedPlayers;

GameData(
  this.user,
);

  GameData.fromJson(Map<dynamic, dynamic> json) {
    id =  json['id'];
    venueName = json['venue_name'];
    phone = json['phone'];
    playersNumber = json['players_number'];
    price = double.parse(json['price']).round();
    date = json['date'];
    time = json['time'];
    city = json['city'];
    area = json['area'];
    type = json['type'];
    user = json['user'] != null ?  UserJoinGameData.fromJson(json['user']) : null;
    location = json['location'];
    joinedPlayersCount = json['joined_players_count'];
       if (json['accepted_players'] != null) {
      acceptedPlayers = <AcceptedPlayers>[];
      json['accepted_players'].forEach((v) {
        acceptedPlayers!.add(AcceptedPlayers.fromJson(v));
      });
    }
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


  UserJoinGameData.fromJson(Map<dynamic, dynamic> json) {
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

class GamePlayersGameData {
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

  GamePlayersGameData(
   {
     this.id,
    this.image,
    this.name,
    this.weight,
    this.height,
    this.age
   }
  );


  GamePlayersGameData.fromJson(Map<dynamic, dynamic> json) {
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

class AcceptedPlayers {
  GamePlayersGameData? data;

  AcceptedPlayers({this.data});

  AcceptedPlayers.fromJson(Map <dynamic,dynamic> json) {
    data = json['data'] != null ?  GamePlayersGameData.fromJson(json['data']) : null;
  }
}