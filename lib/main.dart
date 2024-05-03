import 'package:flutter/material.dart';
import 'package:lets_go/features/favroite/favourite_page.dart';
import 'package:lets_go/features/my_trip/trips.dart';
import 'package:lets_go/get_started/get_started.dart';

import 'features/home/home_page.dart';
import 'features/profile/ui/screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted()
    );
  }

  _builPage(int _selectedIndex) {
    switch (_selectedIndex) {
      case 1:
        return MyTrips();
      case 2:
        return FavroitePage();
      case 3:
        return ProfilePage();
      default:
        return HomePage();
    }

  }
}