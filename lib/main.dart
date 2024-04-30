import 'package:flutter/material.dart';
import 'package:lets_go/features/home/home_page.dart';
void main (){
  runApp(const Myapp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}