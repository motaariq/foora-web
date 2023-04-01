// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:forra_web/screens/profile_screen/profile_screen.dart';
import 'package:forra_web/screens/welcome_screen/components/welcome_widgets.dart';
import 'package:forra_web/components/components.dart';
import 'package:forra_web/components/constants.dart';
import 'package:forra_web/shared/cubit/forraCubit.dart';
import 'package:forra_web/shared/cubit/forraStates.dart';
import 'package:intl/intl.dart';

import '../../components/controllers.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  static const String route = '/home';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<forraCubit, forraStates>(
      listener: (context, state) {
         if (state is FooraRequestSuccessState) {
          if (state.requestModel.success!) {
            showToast(state.requestModel.message,
                context: context,
                animation: StyledToastAnimation.slideFromBottom,
                position: StyledToastPosition.bottom,
                textStyle:
                    TextStyle(fontFamily: 'jannah', color: Colors.white));
            Navigator.pop(context);
            phonerequestController.text = '';
            namerequestController.text = '';
            locationrequestController.text = '';
            pricerequestController.text = '';
            playersrequestController.text = '';
            daterequestController.text = '';
            timerequestController.text = '';
          } else {
            showToast(state.requestModel.message,
                context: context,
                animation: StyledToastAnimation.slideFromBottom,
                position: StyledToastPosition.bottom,
                textStyle:
                    TextStyle(fontFamily: 'jannah', color: Colors.white));
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! FooraGetGamesLoadingState &&
              state is! FooraProfileLoadingState,
          builder: (context) => Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              toolbarHeight: 75,
              backgroundColor: primaryColor,
              actions: [
                ConditionalBuilder(
                    condition:
                        forraCubit.get(context).userInfomodel!.data!.image !=
                            null,
                    builder: (context) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              navigateTo(context, ProfileScreen.route);
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(forraCubit
                                  .get(context)
                                  .userInfomodel!
                                  .data!
                                  .image!),
                            ),
                          ),
                        ),
                    fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ))
              ],
              title: Row(
                children: [
                  Text(
                    'Foora-Goo',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 850,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/home2.jpg')),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 180),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'We Make The Way ',
                                        style: TextStyle(
                                            fontSize: 35,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Easy',
                                        style: TextStyle(
                                            fontSize: 35,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'select your team , select your place and time',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 150),
                                child: Container(
                                  width: 952,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Select your City',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.white)),
                                              child: CoolDropdown(
                                                dropdownList: forraCubit
                                                    .get(context)
                                                    .citydropdownItemList,
                                                placeholder: 'Select your city',
                                                placeholderTS: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                                onChange: (index) {
                                                  forraCubit
                                                      .get(context)
                                                      .changeCityDropDown(index);
                                                },
                                                dropdownHeight: 250,
                                                resultHeight: 60,
                                                dropdownWidth: 300,
                                                resultWidth: 300,
                                                selectedItemBD: BoxDecoration(
                                                    color: Colors.orange
                                                        .withOpacity(0.5)),
                                                selectedItemTS: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                                resultTS: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                                resultBD: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Select your area',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.white)),
                                              child: CoolDropdown(
                                                dropdownList: forraCubit
                                                    .get(context)
                                                    .areadropdownItemList,
                                                placeholder: 'Select your area',
                                                placeholderTS: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                                onChange: (index) {
                                                  forraCubit
                                                      .get(context)
                                                      .changeAreaDropDown(index);
                                                },
                                                dropdownHeight: 250,
                                                resultHeight: 60,
                                                dropdownWidth: 300,
                                                resultWidth: 300,
                                                selectedItemBD: BoxDecoration(
                                                    color: Colors.orange
                                                        .withOpacity(0.5)),
                                                selectedItemTS: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                                resultTS: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                                resultBD: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.search,
                                                color: Colors.orange,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (context) =>
                                                          StatefulBuilder(
                                                            builder: (context,
                                                                    setState) =>
                                                                Container(
                                                              width:
                                                                  double.infinity,
                                                              child: AlertDialog(
                                                                scrollable: true,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(
                                                                                10.0))),
                                                                content: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Make a Game',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color: Colors
                                                                                .black,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Text(
                                                                            'Football Yard',
                                                                            style: TextStyle(
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.black),
                                                                          ),
                                                                          Text(
                                                                            'Please fill it by yard Name',
                                                                            style: TextStyle(
                                                                                fontSize: 16,
                                                                                color: Colors.grey[600]),
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                350,
                                                                            child:
                                                                                TextFormField(
                                                                              controller:
                                                                                  namerequestController,
                                                                              validator:
                                                                                  (value) {
                                                                                if (value!.isEmpty) {
                                                                                  return "email mustn't be empty";
                                                                                }
                                                                              },
                                                                              cursorColor:
                                                                                  Colors.blue,
                                                                              cursorHeight:
                                                                                  25,
                                                                              style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontFamily: 'jannah',
                                                                                  fontSize: 14),
                                                                              keyboardType:
                                                                                  TextInputType.name,
                                                                              decoration: InputDecoration(
                                                                                  hintText: 'Venuen Name',
                                                                                  contentPadding: EdgeInsets.only(bottom: 15, left: 8, top: 5),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: const BorderSide(color: Colors.blue),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.grey),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Phone Number',
                                                                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Text(
                                                                                'Please fill it by your Phone',
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                                                              ),
                                                                              Container(
                                                                                height: 40,
                                                                                width: 350,
                                                                                child: TextFormField(
                                                                                  controller: phonerequestController,
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return "phone mustn't be empty";
                                                                                    }
                                                                                  },
                                                                                  cursorColor: Colors.blue,
                                                                                  cursorHeight: 25,
                                                                                  style: const TextStyle(color: Colors.black, fontFamily: 'jannah', fontSize: 14),
                                                                                  keyboardType: TextInputType.phone,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'Phone Number',
                                                                                      contentPadding: EdgeInsets.only(bottom: 15, left: 8, top: 5),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(color: Colors.blue),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(color: Colors.grey),
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Location',
                                                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                'Please put the playground location',
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                                                              ),
                                                                              Container(
                                                                                height: 40,
                                                                                width: 350,
                                                                                child: TextFormField(
                                                                                  controller: locationrequestController,
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return "location mustn't be empty";
                                                                                    }
                                                                                  },
                                                                                  cursorColor: Colors.blue,
                                                                                  cursorHeight: 25,
                                                                                  style: const TextStyle(color: Colors.black, fontFamily: 'jannah', fontSize: 14),
                                                                                  keyboardType: TextInputType.url,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'Location',
                                                                                      contentPadding: EdgeInsets.only(bottom: 15, left: 8, top: 5),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(color: Colors.blue),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(color: Colors.grey),
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Select Your City',
                                                                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Text(
                                                                                'Please select your city',
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                                                              ),
                                                                              Container(
                                                                                height: 50,
                                                                                width: 300,
                                                                                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white)),
                                                                                child: CoolDropdown(
                                                                                  dropdownList: forraCubit.get(context).citydropdownItemList,
                                                                                  placeholder: 'Select your city',
                                                                                  placeholderTS: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                                                                  onChange: (index) {
                                                                                    forraCubit.get(context).changeCityDropDown(index);
                                                                                  },
                                                                                  dropdownHeight: 250,
                                                                                  resultHeight: 60,
                                                                                  dropdownWidth: 300,
                                                                                  resultWidth: 300,
                                                                                  selectedItemBD: BoxDecoration(color: Colors.orange.withOpacity(0.5)),
                                                                                  selectedItemTS: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                                  resultTS: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                                                                  resultBD: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Text(
                                                                            'Select Your Area',
                                                                            style: TextStyle(
                                                                                fontSize: 20,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            'Please select your Area',
                                                                            style: TextStyle(
                                                                                fontSize: 16,
                                                                                color: Colors.grey[600]),
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                50,
                                                                            width:
                                                                                300,
                                                                            decoration: BoxDecoration(
                                                                                color: Colors.grey[100],
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                border: Border.all(color: Colors.white)),
                                                                            child:
                                                                                CoolDropdown(
                                                                              dropdownList:
                                                                                  forraCubit.get(context).areadropdownItemList,
                                                                              placeholder:
                                                                                  'Select your Area',
                                                                              placeholderTS: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.bold),
                                                                              onChange:
                                                                                  (index) {
                                                                                forraCubit.get(context).changeAreaDropDown(index);
                                                                              },
                                                                              dropdownHeight:
                                                                                  250,
                                                                              resultHeight:
                                                                                  60,
                                                                              dropdownWidth:
                                                                                  300,
                                                                              resultWidth:
                                                                                  300,
                                                                              selectedItemBD:
                                                                                  BoxDecoration(color: Colors.orange.withOpacity(0.5)),
                                                                              selectedItemTS:
                                                                                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                              resultTS: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: Colors.black,
                                                                                  fontWeight: FontWeight.bold),
                                                                              resultBD:
                                                                                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Number of players',
                                                                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Text(
                                                                                'Put the number you need to fill your game',
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                                                              ),
                                                                              Container(
                                                                                height: 40,
                                                                                width: 350,
                                                                                child: TextFormField(
                                                                                  controller: playersrequestController,
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return "Players mustn't be empty";
                                                                                    }
                                                                                  },
                                                                                  cursorColor: Colors.blue,
                                                                                  cursorHeight: 25,
                                                                                  style: const TextStyle(color: Colors.black, fontFamily: 'jannah', fontSize: 14),
                                                                                  keyboardType: TextInputType.number,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'Number of Players',
                                                                                      contentPadding: EdgeInsets.only(bottom: 15, left: 8, top: 5),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(color: Colors.blue),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(color: Colors.grey),
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Price of the game',
                                                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                'Please put the fees or the game price',
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                                                              ),
                                                                              Container(
                                                                                height: 40,
                                                                                width: 350,
                                                                                child: TextFormField(
                                                                                  controller: pricerequestController,
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return "Price mustn't be empty";
                                                                                    }
                                                                                  },
                                                                                  cursorColor: Colors.blue,
                                                                                  cursorHeight: 25,
                                                                                  style: const TextStyle(color: Colors.black, fontFamily: 'jannah', fontSize: 14),
                                                                                  keyboardType: TextInputType.number,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'Price',
                                                                                      contentPadding: EdgeInsets.only(bottom: 15, left: 8, top: 5),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(color: Colors.blue),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(color: Colors.grey),
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Date',
                                                                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Text(
                                                                                'Please put the game date',
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                                                              ),
                                                                              Container(
                                                                                height: 50,
                                                                                width: 300,
                                                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
                                                                                child: TextFormField(
                                                                                  controller: daterequestController,
                                                                                  onTap: () {
                                                                                    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.parse('2025-01-01')).then((value) {
                                                                                      daterequestController.text = DateFormat('yyyy-MM-dd').format(value!).replaceAll('/', '-');
                                                                                    });
                                                                                  },
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return "date mustn't be empty";
                                                                                    }
                                                                                  },
                                                                                  style: const TextStyle(color: Colors.black, fontFamily: 'jannah'),
                                                                                  keyboardType: TextInputType.datetime,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'date',
                                                                                      hintStyle: const TextStyle(color: Color(0xff67686D), fontFamily: 'jannah'),
                                                                                      prefixIcon: const Icon(
                                                                                        Icons.calendar_month_outlined,
                                                                                        color: Color(0xff67686D),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(color: Colors.blue),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        borderSide: BorderSide(color: Color(0xff3A3F47)),
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Spacer(),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Time',
                                                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                'Please put the game time',
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                                                              ),
                                                                              Container(
                                                                                height: 50,
                                                                                width: 300,
                                                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
                                                                                child: TextFormField(
                                                                                  controller: timerequestController,
                                                                                  onTap: () {
                                                                                    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                                                                                      timerequestController.text = value!.format(context).toString();
                                                                                    });
                                                                                  },
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return "time mustn't be empty";
                                                                                    }
                                                                                  },
                                                                                  style: const TextStyle(color: Colors.black, fontFamily: 'jannah'),
                                                                                  keyboardType: TextInputType.text,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'Time',
                                                                                      hintStyle: const TextStyle(color: Color(0xff67686D), fontFamily: 'jannah'),
                                                                                      prefixIcon: const Icon(
                                                                                        Icons.watch_later_outlined,
                                                                                        color: Color(0xff67686D),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(color: Colors.blue),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        borderSide: BorderSide(color: Color(0xff3A3F47)),
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            25,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Spacer(),
                                                                          ConditionalBuilder(
                                                                            condition: state is! FooraRequestLoadingState, 
                                                                            builder: (context) => InkWell(
                                                                            onTap:
                                                                                () {
                                                                              forraCubit.get(context).createRequest(
                                                                                  name: namerequestController.text,
                                                                                  phone: phonerequestController.text,
                                                                                  playersNumber: int.parse(playersrequestController.text),
                                                                                  price: int.parse(pricerequestController.text),
                                                                                  date: daterequestController.text,
                                                                                  time: timerequestController.text,
                                                                                  city: forraCubit.get(context).citycurrentindexdrop,
                                                                                  area: forraCubit.get(context).areacurrentindexdrop!,
                                                                                  location: locationrequestController.text);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  200,
                                                                              height:
                                                                                  50,
                                                                              decoration:
                                                                                  BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(5)),
                                                                              child:
                                                                                  Center(
                                                                                child: Text(
                                                                                  'Lets Make a game',
                                                                                  style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                            fallback:(context) => Center(
                                                                              child: CircularProgressIndicator(color: Colors.orange,) ,
                                                                            ))
                                                                        ],
                                                                      )
                                                                    ]),
                                                              ),
                                                            ),
                                                          ));
                                            },
                                            child: Container(
                                              width: 200,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  'Lets Make a game',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'RECOMMENDED GAMES',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 3,
                          width: 80,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 440,
                          child: Center(
                            child: recommendedCardList(
                                context, forraCubit.get(context).gamesModel!),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'RECOMMENDED STADIUMS',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 3,
                          width: 80,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 330,
                          alignment: Alignment.center,
                          child: Center(
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    recommendedStadiumCard(),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                itemCount: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Our Stars',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 3,
                          width: 80,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: Center(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ourStarsCard(),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                itemCount: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
