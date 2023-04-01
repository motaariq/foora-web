// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:forra_web/models/games/games_model.dart';
import 'package:forra_web/models/user/user_info.dart';
import 'package:lottie/lottie.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

Widget captinBody(context,GameData model)=>Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xfffafafa),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 1309,
                            height: 630,
                            color: Colors.white,
                            child : VerticalTabs(

                              tabsWidth: 200,
                              indicatorColor: Colors.orange,
                              indicatorWidth: 0,
                              tabTextStyle: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  // fontSize: 100
                              ),
                              selectedTabTextStyle:TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  // fontSize: 34
                              ),
                              tabsElevation: 0,
                              tabsShadowColor: Colors.transparent,
                              tabBackgroundColor: Color(0xfffafafa),
                              selectedTabBackgroundColor: Colors.orange.withOpacity(0.3),
                              backgroundColor:Color(0xfffafafa),
                              tabs: <Tab>[
                                Tab(child: Text('Personal Information',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black
                                ),)),
                                Tab(child: Text('Skills',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),)),
                                Tab(child: Text('Played Matchs',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black
                                ),)),
                              ],
                              contents: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(

                                            radius: 50,
                                            backgroundImage: NetworkImage(model.user!.image!),
                                          ),
                                        
                                        ],
                                      ),
                                      SizedBox(height: 25,),
                                      Row(
                                        children: [
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Name',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text(model.user!.name!,style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Icon(Icons.person_pin,color: Colors.orange,size: 60,)
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 70,),
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Age',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text(model.user!.age!,style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Icon(Icons.insert_drive_file_outlined,color: Colors.orange,size: 60,)
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 25,),
                                      Row(
                                        children: [
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Weight',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text(model.user!.weight!,style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Icon(Icons.man,color: Colors.orange,size: 60,)
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 70,),
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Height',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text(model.user!.height!,style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Icon(Icons.height,color: Colors.orange,size: 60,)
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(

                                            radius: 50,
                                            backgroundImage: NetworkImage(model.user!.image!),
                                          ),
                                          SizedBox(width: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(model.user!.name!,style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24
                                          ),),
                                          Text('7.6',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                              fontSize: 20
                                          ),)
                                            ],
                                          )
                                          
                                        ],
                                      ),
                                      SizedBox(height: 25,),
                                      Row(
                                        children: [
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Speed',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text('88',style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Lottie.asset('assets/images/skills.json')
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 70,),
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Dribling',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text('89',style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Lottie.asset('assets/images/skills.json')
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 25,),
                                      Row(
                                        children: [
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Shoot',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text('89',style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Lottie.asset('assets/images/skills.json')
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 70,),
                                          Container(
                                            width: 333,
                                            height: 124,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Team',style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18
                                                      ),),
                                                      SizedBox(height: 10,),
                                                      Text('90',style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 18
                                                      ),)
                                                    ],
                                                  ),
                                                  Spacer(),
                                                 Lottie.asset('assets/images/skills.json')
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(child: Text(''), padding: EdgeInsets.all(20)),
                              ],
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              )
            ],
          );