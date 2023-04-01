// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, prefer_const_constructors, avoid_print, deprecated_member_use

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forra_web/screens/login_screen/login_screen.dart';
import 'package:forra_web/shared/cubit/forraStates.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/components.dart';
import '../../components/constants.dart';
import '../../models/games/games_model.dart';
import '../../models/games/joinlist_model.dart';
import '../../models/games/request_model.dart';
import '../../models/places/area_model.dart';
import '../../models/places/city_model.dart';
import '../../models/user/image_model.dart';
import '../../models/user/user_created_model.dart';
import '../../models/user/user_info.dart';
import '../../models/user/user_model.dart';
import '../cahcehelper/CacheHelper.dart';
import '../diohelper/dioHelper.dart';
import '../endpoints/endpoints.dart';

class forraCubit extends Cubit<forraStates> {
  forraCubit() : super(ForraInitialState());

  static forraCubit get(context) => BlocProvider.of(context);

  dynamic value = 1;
  int players = 1;
  File? imageFile;

  //models
  UserModel? userModel;
  UserInfo? userInfomodel;
  ImageModel? imageModel;
  CityModel? cityModel;
  AreaModel? areaModel;
  RequestModel? requestModel;
  UserCreatedModel ? userCreatedModel;
  UserCreatedData ? userCreatedData;
  GamesModel? gamesModel;
  GameData? gameData;
  JoinListModel? joinListModel;

  //index
  int ? userrgameCreatedInfoIndex;

  //controllers


  //USERLOGIN
  void userLogin({required String email, required String password}) {
    emit(FooraLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(FooraLoginSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraLoginErrorState(error.toString()));
    });
  }

  //register post
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String age,
    required String weight,
    required String height,
    required int cityId,
    required int areaId,
  }) async {
    emit(FooraRegisterLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'weight': weight,
      'height': height,
      'age': age,
      'city_id': cityId,
      'area_id': areaId
    }).then((value) {
      print(value.data.toString());
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(FooraRegisterSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraRegisterErrorState(error.toString()));
    });
  }

  void userChangePassword({required String oldPassword,
    required String newPassword,
    required String confirmPassword}) {
    emit(FooraChangePasswordLoadingState());
    DioHelper.postData(
        url: CHANGEPASSWORD,
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
          'new_password_confirmation': confirmPassword
        },
        token: token)
        .then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(FooraChangePasswordSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraChangePasswordErrorState(error.toString()));
    });
  }

  //update user
  void userUpdate({
    required String name,
    required String email,
    required String phone,
    required String age,
    required String weight,
    required String height,
  }) {
    emit(FooraUpdateLoadingState());
    DioHelper.putData(token: token, url: UPDATE, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
      'weight': weight,
      'height': height
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data.toString());
      print(token.toString());
      emit(FooraUpdateSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraUpdateErrorState(error.toString()));
    });
  }

  Future<void> uploadImage(File file) async {
    String fileName = file.path
        .split('/')
        .last;
    FormData formData = FormData.fromMap({
      "profile_image":
      await MultipartFile.fromFile(file.path, filename: fileName),
    });
    emit(FooraUpdatePhotoLoadingState());
    DioHelper.postData(url: PHOTO, data: formData, token: token).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data.toString());
      emit(FooraUpdatePhotoSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraUpdatePhotoErrorState(error.toString()));
    });
  }

  //delete usercreatedmatch
  // void deleteUserCreated(){
  //   emit(FooraDeleteUserCreatedLoadingState());
  //   DioHelper.deleteData(url: 'delete-game/${userCreatedData.}',token: token)
  // }

   getGames({required int cityId, int ?areaID}) {
    emit(FooraGetGamesLoadingState());
    DioHelper.postData(url: SEARCHGAMES, token: token, data: {
      'city_id': cityId,
      'area_id': areaID
    }).then((value) {
      gamesModel = GamesModel.fromJson(value.data);
      print(value.data);
      emit(FooraGetGamesSuccessState(gamesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraGetGamesSErrorState(error.toString()));
    });
  }

  //get profile
   getProfile({required String apitoken}) async {
    emit(FooraProfileLoadingState());
    await DioHelper.getData(url: PROFILE, token: apitoken).then((value) {
      userInfomodel = UserInfo.fromJson(value.data);
      print(token);
      print(userInfomodel!.data!.image);
      emit(FooraProfileSuccessState(userInfomodel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraProfileErrorState(error.toString()));
    });
  }

  void userCreatedMatchs() {
    emit(FooraUserCreatedLoadingState());
    DioHelper.getData(url: USERCREATEDGAMED,
        token: token).then((value) {
      userCreatedModel = UserCreatedModel.fromJson(value.data);
      print('zzz ${value.data.toString()}');
      emit(FooraUserCreatedSuccessState(userCreatedData!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraUserCreatedErrorState(error.toString()));
    });
  }

//CITY GET
  getCity() {
    emit(FooraCityLoadingState());
    DioHelper.getData(url: CITY, token: token).then((value) {
      cityModel = CityModel.fromJson(value.data);
      print(value.data.toString());
      emit(FooraCitySuccessState(cityModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraCityErrorState(error.toString()));
    });
  }

  getArea() async {
    emit(FooraAreaLoadingState());
    await DioHelper.getData(
        url: 'city/$citycurrentindexdrop/areas', token: token).then((value) {
      areaModel = AreaModel.fromJson(value.data);
      print(value.data);
      emit(FooraAreaSuccessState(areaModel!));
      areaDrop();
    }).catchError((error) {
      print(error.toString());
      emit(FooraAreaErrorState(error.toString()));
    });
  }

  //request post
  void createRequest({
    required String name,
    required String phone,
    required int playersNumber,
    required int price,
    required String date,
    required String time,
    required int city,
    required int area,
    required String location,
  }) async {
    emit(FooraRequestLoadingState());
    DioHelper.postData(url: CREATE, data: {
      'name': name,
      'players_number': playersNumber,
      'price': price,
      'phone': phone,
      'date': date,
      'time': time,
      'city_id': city,
      'area_id': area,
      'location_url': location,
      'type': 1
    }, token: token).then((value) {
      requestModel = RequestModel.fromJson(value.data);
      print(value.data);
      emit(FooraRequestSuccessState(requestModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraRequestErrorState(error.toString()));
    });
  }

  void editRequest({
    required String name,
    required String phone,
    required int playersNumber,
    required int price,
    required String date,
    required String time,
    int? city,
    int? area,
    required String location,
  }) {
    emit(FooraUpdateRequestLoadingState());
    DioHelper.putData(
        url: 'update-game/${userCreatedData!.id}',
        data: {
          'name': name,
          'players_number': playersNumber,
          'price': price,
          'phone': phone,
          'date': date,
          'time': time,
          'city_id': city,
          'area_id': area,
          'location_url': location,
        },
        token: token
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(FooraUpdateRequestSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraUpdateRequestErrorState(error.toString()));
    });
  }

  deleteRequest(int id) {
    emit(FooraDeleteRequestLoadingState());
    DioHelper.deleteData(url: 'delete-game/$id', token: token).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(FooraDeleteRequestSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraDeleteRequestErrorState(error.toString()));
    });
  }

  joinGame({required int gameId}) {
    emit(FooraJoinRequestLoadingState());
    DioHelper.postData(url: JOIN,
        data: {
          'game_id': gameId
        },
        token: token).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(FooraJoinRequestSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraJoinRequestErrorState(error.toString()));
    });
  }

  getJoinList() {
    emit(FooraJoinListLoadingState());
    DioHelper.getData(url: JOINLIST, token: token).then((value) {
      joinListModel = JoinListModel.fromJson(value.data);
      print(value.data.toString());
      emit(FooraJoinListSuccessState(joinListModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraJoinListErrorState(error.toString()));
    });
  }

  deletePhoto() {
    emit(FooraDeletePhotoLoadingState());
    DioHelper.deleteData(url: DELETEPHOTO, token: token)
        .then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(FooraDeletePhotoSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FooraDeletePhotoErrorState(error.toString()));
    });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> openMap(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }

  //LOGOUT
  void logOut({required String apitoken, context}) {
    DioHelper.postData(url: LOGOUT, token: apitoken).then((value) {
      navigatePush(context, LoginScreen());
    }).catchError((error) {
      print(error.toString());
    });
  }

  //change players
  changeplusPlayers() {
    if (players >= 10) {
      players = 10;
    } else {
      players++;
    }
    emit(RequestChangePlusPlayersState());
  }

  changeMinusPlayers() {
    if (players <= 1) {
      players = 1;
    } else {
      players--;
    }
    emit(RequestChangeMinusPlayersState());
  }

  //smooth indicator
  int activeIndicator = 0;

  changeIndicator(int index) {
    activeIndicator = index;
    emit(ForraChangeIndicatorState());
  }

//image picker
  pickFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    imageFile = File(pickedImage!.path);
    imageFile = await cropImage(imageFile: imageFile!);
    emit(ForraAddPhotoState());
  }

  //image crop
  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) {
      return null;
    } else {
      return File(croppedImage.path);
    }
  }

  //change pass vis
  bool isVis = true;
  Icon visiable = Icon(Icons.visibility_outlined);

  changeVis() {
    if (isVis == true) {
      isVis = false;
      visiable = Icon(Icons.visibility_off_outlined);
    } else {
      isVis = true;
      visiable = Icon(Icons.visibility_outlined);
    }
    emit(ForraChangeVisiableState());
  }

  //signout
  void signOut(context) {
    CacheHelper.removeData(key: 'token').then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
              (route) => false);
      emit(FooraLogout());
    });
  }

   cityDrop() {
    citydropdownItemList.clear();
    for (var v in cityModel!.data!) {
      citydropdownItemList.add({'label': v.name!, 'value': v.id.toString()});
    }
    emit(FooraCityState());
  }

  areaDrop() {
    areadropdownItemList.clear();
    for (var v in areaModel!.data!) {
      areadropdownItemList.add({'label': v.name, 'value': v.id.toString()});
    }
    emit(FooraAreaState());
  }

  int citycurrentindexdrop = 0;
  List citydropdownItemList = [
    {'label': 'None', 'value': '0'},

  ];

  changeCityDropDown(index) {
    areadropdownItemList.clear();
    citycurrentindexdrop = int.parse(index['value']);
    cityDropdown = citycurrentindexdrop;
    print(citycurrentindexdrop);
    print('wasyt $cityDropdown');
    getArea();
    emit(FooraCityChangeDropState());
  }

  int? areacurrentindexdrop;
  List areadropdownItemList = [
    {'label': 'None', 'value': '0'},
  ];

  changeAreaDropDown(index) {
    areacurrentindexdrop = int.parse(index['value']);
    print(areacurrentindexdrop);
    emit(FooraAreaChangeDropState());
  }
}
