import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_go/features/home/ui/home.dart';
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
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

     Future.delayed(const Duration(seconds: 2),(){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const Home(),),);
     });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
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