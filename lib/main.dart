import 'package:flutter/material.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DetailsPage(),
    );
  }
}