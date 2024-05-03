import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_go/features/favourite/ui/screens/favourite_page.dart';
import 'package:lets_go/features/home/bloc/home_bloc.dart';
import 'package:lets_go/features/home/home_page.dart';
import 'package:lets_go/features/my_trip/trips.dart';
import 'package:lets_go/features/profile/ui/screen/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.notes_rounded)),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(
                    "https://t4.ftcdn.net/jpg/06/43/68/65/360_F_643686558_Efl6HB1ITw98bx1PdAd1wy56QpUTMh47.jpg"),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.explore,),
                label: "Explore",),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined,), label: "My Trip",),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,), label: "Favroite",),
            BottomNavigationBarItem(icon: Icon(Icons.person,), label: "Profile",),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.blue.shade400,
          fixedColor: Colors.blue.shade400,
          onTap: _onItemTapped,
          elevation: 5,
        ),
        body: _builPage(_selectedIndex),
      ),
    );
  }
}

_builPage(int _selectedIndex) {
  switch (_selectedIndex) {
    case 1:
      return const MyTrips();
    case 2:
      return const FavoritePage();
    case 3:
      return const ProfilePage();
    default:
      return const HomePage();
  }
}
