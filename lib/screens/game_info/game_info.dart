// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:forra_web/screens/game_info/components/game_info_widgets.dart';
import 'package:forra_web/shared/cubit/forraCubit.dart';
import 'package:forra_web/shared/cubit/forraStates.dart';
import '../../components/constants.dart';


class GameInfo extends StatelessWidget {
  const GameInfo({Key? key}) : super(key: key);
  static const String route = '/game_info';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<forraCubit,forraStates>(
      listener: (context, state) {
        if(state is FooraJoinRequestSuccessState){
          if(state.userModel.success!){
            showToast(state.userModel.message,
                context: context,
                animation: StyledToastAnimation.slideFromBottom,
                position: StyledToastPosition.bottom,
                textStyle:
                    TextStyle(fontFamily: 'jannah', color: Colors.white));
            Navigator.pop(context);
            
          }else{
            showToast(state.userModel.message,
                context: context,
                animation: StyledToastAnimation.slideFromBottom,
                position: StyledToastPosition.bottom,
                textStyle:
                    TextStyle(fontFamily: 'jannah', color: Colors.white));
          }
        }
      },
      builder: (context, state) {
        return Scaffold(

      backgroundColor: Colors.grey[200],
      appBar:  AppBar(
            toolbarHeight: 75,
                backgroundColor: primaryColor,
                actions: [
                  ConditionalBuilder(condition: forraCubit.get(context).userInfomodel!.data!.image != null,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(forraCubit.get(context).userInfomodel!.data!.image!),
                          ),
                        ),
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator(),))
                ],
                title: Row(
                  children: [
                    Text(
                      'Foora-Goo',
                      style:
                      TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text('Home', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 25,
                    ),
                    Text('Games', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 25,
                    ),
                    Text('Stadiums', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 25,
                    ),
                    Text('Captins', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 25,
                    ),
                    Text('About', style: TextStyle(color: Colors.white))
                  ],
                ),
          ),
      body: ConditionalBuilder(
        condition: forraCubit.get(context).gameData != null ,
        builder: (context) => gameInfoBody(context, forraCubit.get(context).gameData!) ,
        fallback:(context) => Center(child: CircularProgressIndicator(),),
        )
    );
      },
    );
  }
}
