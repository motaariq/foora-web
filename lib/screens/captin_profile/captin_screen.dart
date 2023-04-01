// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forra_web/screens/captin_profile/components/captin_widgets.dart';
import 'package:forra_web/shared/cubit/forraCubit.dart';
import 'package:forra_web/shared/cubit/forraStates.dart';
import 'package:lottie/lottie.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';
import '../../components/constants.dart';

class CaptinScreen extends StatefulWidget {
  const CaptinScreen({Key? key}) : super(key: key);
  static const String route = '/captin';
  @override
  State<CaptinScreen> createState() => _captinScreenState();
}

class _captinScreenState extends State<CaptinScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    var tabController = TabController(length: 2, vsync: this);
    return BlocConsumer<forraCubit,forraStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xfffafafa),
          appBar: AppBar(
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
          body: captinBody(context, forraCubit.get(context).gameData!)
        );
      },
    );
  }
}
