// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forra_web/screens/captin_profile/captin_screen.dart';
import 'package:forra_web/screens/game_info/game_info.dart';
import 'package:forra_web/screens/home_screen/home_screen.dart';
import 'package:forra_web/screens/login_screen/login_screen.dart';
import 'package:forra_web/screens/profile_screen/profile_screen.dart';
import 'package:forra_web/screens/welcome_screen/welcome_screen.dart';
import 'package:forra_web/shared/cahcehelper/CacheHelper.dart';
import 'package:forra_web/shared/cubit/forraCubit.dart';
import 'package:forra_web/shared/diohelper/dioHelper.dart';

import 'components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  token = CacheHelper.getData(key: 'token');
  print(token);
  runApp(
    MyApp(),
     // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => forraCubit()
                ..getCity()..getGames(cityId: 1)
          )
        ],
        child: MaterialApp(
          
          initialRoute: HomeScreen.route,
          routes: {

            LoginScreen.route : (context)=> LoginScreen(),
            WelcomeScreen.route: (context) => WelcomeScreen(),
            GameInfo.route :(context) => GameInfo(),
            ProfileScreen.route :(context) => ProfileScreen(),
            CaptinScreen.route :(context) => CaptinScreen()
          },
          title: 'Forra Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'jannah',
          ),
          home: HomeScreen(),
        ));
  }
}