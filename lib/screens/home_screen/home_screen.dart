// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:forra_web/screens/login_screen/login_screen.dart';
import 'package:forra_web/components/components.dart';
import 'package:forra_web/components/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/home.jpg')),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '[',
                style: TextStyle(fontSize: 300, color: Colors.orange),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'We Make The Way Easy',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'select your team , select your place and time',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        InkWell(
                          onTap:(){
                           navigateTo(context, LoginScreen.route);
                          },
                          child: Container(
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text('Login',style: TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text('Sign Up',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
