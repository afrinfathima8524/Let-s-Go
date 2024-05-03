import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lets_go/get_started/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStarted(),));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.network("https://clipart-library.com/images_k/travel-clipart-transparent/travel-clipart-transparent-25.png",fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }
}