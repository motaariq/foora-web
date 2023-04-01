import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

navigatePush(context, state) {
  Navigator.of(context).pushNamedAndRemoveUntil(state, (route) => false);
}

Widget myLoader()=>  Center(child: Lottie.asset('assets/images/loading.json',height: 100,width: 100,frameRate: FrameRate(60)));


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
