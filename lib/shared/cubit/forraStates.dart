// ignore_for_file: camel_case_types, file_names

import 'package:forra_web/models/games/games_model.dart';
import 'package:forra_web/models/games/joinlist_model.dart';
import 'package:forra_web/models/games/request_model.dart';
import 'package:forra_web/models/places/area_model.dart';
import 'package:forra_web/models/places/city_model.dart';
import 'package:forra_web/models/user/user_created_model.dart';
import 'package:forra_web/models/user/user_info.dart';
import 'package:forra_web/models/user/user_model.dart';

abstract class forraStates{}
class ForraInitialState extends forraStates{}

//USERLOGIN
class FooraLoginLoadingState extends forraStates {}
class FooraLoginSuccessState extends forraStates {
  UserModel userModel;
  FooraLoginSuccessState(this.userModel);
}
class FooraLoginErrorState extends forraStates {
  final String error;
  FooraLoginErrorState(this.error);
}

//USER REGISTER
class FooraRegisterLoadingState extends forraStates {}
class FooraRegisterSuccessState extends forraStates {
  UserModel userModel;
  FooraRegisterSuccessState(this.userModel);
}
class FooraRegisterErrorState extends forraStates {
  final String error;
  FooraRegisterErrorState(this.error);
}

//USER PROFILE
class FooraProfileLoadingState extends forraStates{}
class FooraProfileSuccessState extends forraStates{
    UserInfo userInfomodel;
  FooraProfileSuccessState(this.userInfomodel);
}
class FooraProfileErrorState extends forraStates{
  final String error;
  FooraProfileErrorState(this.error);
}

//user update
class FooraUpdateLoadingState extends forraStates {}
class FooraUpdateSuccessState extends forraStates {
  UserModel userModel;
  FooraUpdateSuccessState(this.userModel);
}
class FooraUpdateErrorState extends forraStates {
  final String error;
  FooraUpdateErrorState(this.error);
}

class FooraUpdatePhotoLoadingState extends forraStates {}
class FooraUpdatePhotoSuccessState extends forraStates {
  UserModel userModel;
  FooraUpdatePhotoSuccessState(this.userModel);
}
class FooraUpdatePhotoErrorState extends forraStates {
  final String error;
  FooraUpdatePhotoErrorState(this.error);
}

//Create Request
class FooraRequestLoadingState extends forraStates {}
class FooraRequestSuccessState extends forraStates {
  RequestModel requestModel;
  FooraRequestSuccessState(this.requestModel);
}
class FooraRequestErrorState extends forraStates {
  final String error;
  FooraRequestErrorState(this.error);
}


//changepassword
class FooraChangePasswordLoadingState extends forraStates {}

class FooraChangePasswordSuccessState extends forraStates {
  UserModel userModel;
  FooraChangePasswordSuccessState(this.userModel);
}

class FooraChangePasswordErrorState extends forraStates {
  final String error;
  FooraChangePasswordErrorState(this.error);
}

class FooraCityLoadingState extends forraStates {}

class FooraCitySuccessState extends forraStates {
  CityModel cityModel;
  FooraCitySuccessState(this.cityModel);
}

class FooraCityErrorState extends forraStates {
  final String error;
  FooraCityErrorState(this.error);
}

//AREA

class FooraAreaLoadingState extends forraStates {}

class FooraAreaSuccessState extends forraStates {
  AreaModel areaModel;
  FooraAreaSuccessState(this.areaModel);
}

class FooraAreaErrorState extends forraStates {
  final String error;
  FooraAreaErrorState(this.error);
}

//delete photo
class FooraDeletePhotoLoadingState extends forraStates {}

class FooraDeletePhotoSuccessState extends forraStates {
  UserModel userModel;
  FooraDeletePhotoSuccessState(this.userModel);
}

class FooraDeletePhotoErrorState extends forraStates {
  final String error;
  FooraDeletePhotoErrorState(this.error);
}

//user created state

class FooraUserCreatedLoadingState extends forraStates {}
class FooraUserCreatedSuccessState extends forraStates {
  UserCreatedData userCreatedData;
  FooraUserCreatedSuccessState(this.userCreatedData);
}
class FooraUserCreatedErrorState extends forraStates {
  final String error;
  FooraUserCreatedErrorState(this.error);
}
//user delete state
class FooraDeleteUserCreatedLoadingState extends forraStates {}
class FooraDeleteUserCreatedSuccessState extends forraStates {
  UserCreatedModel userCreatedModel;
  FooraDeleteUserCreatedSuccessState(this.userCreatedModel);
}
class FooraDeleteUserCreatedErrorState extends forraStates {
  final String error;
  FooraDeleteUserCreatedErrorState(this.error);
}

class FooraGetGamesLoadingState extends forraStates {}
class FooraGetGamesSuccessState extends forraStates {
  GamesModel gamesModel;
  FooraGetGamesSuccessState(this.gamesModel);
}
class FooraGetGamesSErrorState extends forraStates {
  final String error;
  FooraGetGamesSErrorState(this.error);
}

class FooraUpdateRequestLoadingState extends forraStates {}
class FooraUpdateRequestSuccessState extends forraStates {
  UserModel userModel;
  FooraUpdateRequestSuccessState(this.userModel);
}
class FooraUpdateRequestErrorState extends forraStates {
  final String error;
  FooraUpdateRequestErrorState(this.error);
}

class FooraDeleteRequestLoadingState extends forraStates {}
class FooraDeleteRequestSuccessState extends forraStates {
  UserModel userModel;
  FooraDeleteRequestSuccessState(this.userModel);
}
class FooraDeleteRequestErrorState extends forraStates {
  final String error;
  FooraDeleteRequestErrorState(this.error);
}

class FooraJoinRequestLoadingState extends forraStates {}
class FooraJoinRequestSuccessState extends forraStates {
  UserModel userModel;
  FooraJoinRequestSuccessState(this.userModel);
}
class FooraJoinRequestErrorState extends forraStates {
  final String error;
  FooraJoinRequestErrorState(this.error);
}

class FooraJoinListLoadingState extends forraStates {}
class FooraJoinListSuccessState extends forraStates {
  JoinListModel joinListModel;
  FooraJoinListSuccessState(this.joinListModel);
}
class FooraJoinListErrorState extends forraStates {
  final String error;
  FooraJoinListErrorState(this.error);
}

class ForraBottomNavState extends forraStates{}
class RequestInitialState extends forraStates {}
class RequestChangePlusPlayersState extends forraStates {}
class RequestChangeMinusPlayersState extends forraStates {}
class ForraChangeIndicatorState extends forraStates {}
class ForraAddPhotoState extends forraStates {}
class ForraChangeVisiableState extends forraStates {}
class FooraLogout extends forraStates {}
class FooraCityState extends forraStates {}
class FooraAreaState extends forraStates {}
class FooraCityChangeDropState extends forraStates {}
class FooraAreaChangeDropState extends forraStates {}





