// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

navigatePush(context, state) {
  Navigator.of(context).pushNamedAndRemoveUntil(state, (route) => false);
}

Widget myLoader()=>  Center(child: Lottie.asset('assets/images/loading.json',height: 100,width: 100,frameRate: FrameRate(60)));
Widget myFooter(context)=> Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.30,
                      color: Color(0xff081528),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'FOORA-GOO',
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.orange),
                                  ),
                                  Text(
                                    'Sporting project for helping the raising Stars\n to be on the Stage ',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600]),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Text(
                                    '® Copyrights. All rights reserved.foora-goo.com',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600]),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Quick Links',
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  ),
                                  Text('Home',
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                  Text('About',
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                  Text('Get started',
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                  Text('FAQ',
                                      style: TextStyle(color: Colors.grey[600]))
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'New Sletter',
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  ),
                                  Text(
                                      'You can contact us by \n sending us your feedback ',
                                      style: TextStyle(color: Colors.white)),
                                      SizedBox(height: 7,),
                                  Container(
                                    height: 40,
                                    width: 350,
                                    color: Colors.white,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "email mustn't be empty";
                                        }
                                      },
                                      cursorColor: Colors.blue,
                                      cursorHeight: 25,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'jannah',
                                          fontSize: 14),
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                          
                                          suffixIcon: Container(color: Colors.orange,child: Icon(Icons.send,color: Colors.white,)),
                                          contentPadding: EdgeInsets.only(
                                              bottom: 15, left: 8, top: 5),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.blue),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

navigateTo(context, state) {
  Navigator.of(context).pushNamed(state);
}

navigatePushn(context, state) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => state,
      ));
}

//just navigate
navigateTon(context, state) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => state,
      ));
}
