// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:forra_web/components/components.dart';
import 'package:forra_web/models/games/games_model.dart';
import 'package:forra_web/screens/captin_profile/captin_screen.dart';
import 'package:forra_web/shared/cubit/forraCubit.dart';

import '../../../shared/cubit/forraStates.dart';

Widget gameInfoBody(context,GameData model)=> CustomScrollView(
  slivers: [
    SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1100,
              height: 640,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/stadium.jpg'),fit: BoxFit.contain,height: 500,width: 500,),
                  Padding(
                    padding: const EdgeInsets.all(41.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25,),
                        Text(model.venueName!,style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black
                        ),),

                        InkWell(
                          onTap: (){
                            forraCubit.get(context).openMap(model.location!);
                          },
                          child: Text('📍 Open on Maps',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue[700]
                          ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.phone,color:Colors.blue[700]),
                            Text('${model.phone}',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue[700]
                            ),)
                          ],
                        ),
                        SizedBox(height: 13,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(' ${model.area} | ${model.city}',style: TextStyle(

                                fontSize: 18,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        SizedBox(height: 15,),

                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.calendar_today),
                            Text(' ${model.date}',style: TextStyle(

                                fontSize: 18,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.watch),
                            Text(' ${model.time}',style: TextStyle(

                                fontSize: 18,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.person),
                            Text(' ${model.joinedPlayersCount} / ${model.playersNumber} Players',style: TextStyle(

                                fontSize: 18,
                                color: Colors.black
                            ),)
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.attach_money),
                            Text('${model.price} EGP',style: TextStyle(

                                fontSize: 18,
                                color: Colors.black
                            ),)
                          ],
                        ),
                        SizedBox(height: 13,),
                        InkWell(
                          onTap: (){
                            navigateTo(context, CaptinScreen.route);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.person,color: Colors.blue,),
                              Text(' ${model.user!.name}',style: TextStyle(
                        
                                  fontSize: 18,
                                  color: Colors.blue
                              ),),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle_outline,color: Colors.green,),
                            Text(' ${model.type}',style: TextStyle(

                                fontSize: 18,
                                color: Colors.green
                            ),),
                          ],
                        ),
                        SizedBox(height: 32,),
                        ConditionalBuilder(
                          condition: State is ! FooraJoinRequestLoadingState, 
                          builder: (context) => InkWell(
                          onTap:(){
                            forraCubit.get(context).joinGame(gameId: model.id!);
                          },
                          child: Container(
                            width: 230,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text('Join The Lineup',style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,

                              ),),
                            ),
                          ),
                        ),
                          fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.orange),),)

                      ],
                    ),
                  )
                ],
              ),
            ),
            myFooter(context)
          ],
        ),
      ),
     
    )
  ],
);