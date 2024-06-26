import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/get_started/get_started.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 3),(){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const GetStarted(),),);
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 5, child: Image.asset("assets/logo.png",)),
            Expanded(flex: 2, child: Text("Let's Goooooo",style: GoogleFonts.poppins(fontSize:40,color:Colors.blue,fontWeight:FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}