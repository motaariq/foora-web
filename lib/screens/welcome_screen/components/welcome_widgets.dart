// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:forra_web/screens/game_info/game_info.dart';
import 'package:forra_web/components/components.dart';
import 'package:forra_web/shared/cubit/forraCubit.dart';

import '../../../models/games/games_model.dart';

Widget recommendedCardList(context, GamesModel model) => ListView.separated(
  shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) =>
        recommendedGameCard(context, model.data![index],index),
    separatorBuilder: (context, index) => SizedBox(
      width: 20,
    ),
    itemCount: model.data!.length>5 ? 5 : model.data!.length
);

Widget recommendedGameCard(context,GameData model,index)=> Container(
  height: 430,
  width: 269,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)
  ),
  child: Column(
    children: [
      Image(image: AssetImage('assets/images/home2.jpg'),fit: BoxFit.cover,height: 160,width: double.infinity,),
      SizedBox(height: 10,),
      Text(model.venueName!,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.blue[700]
      ),),
      Text(model.area!,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.blue[700]
      ),),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today),
          Text(' ${model.date} | ${model.city}',style: TextStyle(

              fontSize: 18,
              color: Colors.black
          ),),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.watch),
          Text(' ${model.time}',style: TextStyle(

              fontSize: 18,
              color: Colors.black
          ),),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person),
          Text(' ${model.joinedPlayersCount} / ${model.playersNumber} Players',style: TextStyle(

              fontSize: 18,
              color: Colors.black
          ),)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.attach_money),
          Text('${model.price} EGP',style: TextStyle(

              fontSize: 18,
              color: Colors.black
          ),)
        ],
      ),
      SizedBox(height: 10,),
      InkWell(
        onTap:(){
          forraCubit.get(context).gameData = model;
        
          navigateTo(context, GameInfo.route);
        },
        child: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: Text('JOIN',style: TextStyle(
              color: Colors.white,
              fontSize: 14,

            ),),
          ),
        ),
      ),
    ],
  ),
);
Widget recommendedStadiumCard()=>Container(

  width: 269,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)
  ),
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
        Image(image: AssetImage('assets/images/masa.png'),fit: BoxFit.cover,height: 160,width: double.infinity,),
        SizedBox(height: 15,),
        Text('ALMASA Stadium',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.blue[700]
        ),),

        Text('Nasr City | Cairo',style: TextStyle(

            fontSize: 16,
            color: Colors.black
        ),),
        SizedBox(height: 20,),
        InkWell(
          onTap:(){

          },
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25)
            ),
            child: Center(
              child: Text('BOOK',style: TextStyle(
                color: Colors.white,
                fontSize: 14,

              ),),
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget ourStarsCard()=>Container(
  height: 200,
  width: 269,
  decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15)
  ),
  child: Column(
    children: [
      SizedBox(height: 10,),
      CircleAvatar(

        radius: 50,
        backgroundImage: AssetImage('assets/images/profile.jpeg'),
      ),
      SizedBox(height: 10,),
      Text('Mutasim',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blue[700]
      ),),
     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('9.0 ',style: TextStyle(

             fontSize: 16,
             color: Colors.orange
         ),),
         Icon(Icons.star,color: Colors.orange,size: 20),
       ],
     )
    ],
  ),
);