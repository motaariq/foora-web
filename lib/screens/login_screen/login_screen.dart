// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:forra_web/screens/welcome_screen/welcome_screen.dart';
import 'package:forra_web/components/constants.dart';
import 'package:forra_web/shared/cubit/forraCubit.dart';
import 'package:forra_web/shared/cubit/forraStates.dart';
import '../../components/components.dart';
import '../../components/controllers.dart';
import '../../shared/cahcehelper/CacheHelper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String route = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<forraCubit, forraStates>(
      listener: (context, state) async{
        if (state is FooraLoginSuccessState) {
          if (state.userModel.success!) {
            showToast(state.userModel.message,
                context: context,
                animation: StyledToastAnimation.slideFromBottom,
                position: StyledToastPosition.bottom,
                textStyle:
                TextStyle(fontFamily: 'jannah', color: Colors.white));
            CacheHelper.saveData(
                key: 'token', value: state.userModel.data!.token)
                .then((value) async{
              token = state.userModel.data!.token;
              if (value == true) {
                await forraCubit.get(context).cityDrop();
                await forraCubit.get(context).getProfile(apitoken: token!);
                await forraCubit.get(context).getGames(cityId: 1);
                navigatePush(context, WelcomeScreen.route);
                emailController.text = '';
                passwordController.text = '';
              }
            }

            );

          } else {
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
          backgroundColor: primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/login.jpg'),
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Email Address',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 350,
                                        child: TextFormField(
                                          controller: emailController,
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  bottom: 15, left: 8, top: 5),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 350,
                                        child: TextFormField(
                                          controller: passwordController,
                                          obscureText: forraCubit.get(context).isVis,
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
                                          keyboardType:
                                              TextInputType.emailAddress,

                                          decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  forraCubit.get(context).changeVis();
                                                },
                                                icon: forraCubit.get(context).visiable,
                                                color: Colors.blue,
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  bottom: 15, left: 8, top: 5),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ConditionalBuilder(condition: state is ! FooraLoginLoadingState,
                                        builder : (context) =>  InkWell(
                                          onTap: () {
                                            forraCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password: passwordController.text);
                                          },
                                          child: Container(
                                            width: 200,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.blue,),))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text('Forgot your password ?')),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
