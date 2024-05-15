import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/favourite/ui/screens/favourite_page.dart';
import 'package:lets_go/features/home/bloc/home_bloc.dart';
import 'package:lets_go/features/home/home_page.dart';
import 'package:lets_go/features/my_trip/trips.dart';
import 'package:lets_go/features/profile/ui/screen/profile_screen.dart';

import '../../profile/data/profile_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
_scaffoldstate.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldstate,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                _scaffoldstate.currentState?.openDrawer();
                setState(() {
                  profileName = profileName;
                });
              },
              icon: const Icon(Icons.notes_rounded)),
          actions: [
            GestureDetector(
              onTap: () => _onItemTapped(3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 30,
                          height: 30,
                          child: 
                               profileImage==null ? Image.network(
                                  "https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg"):Image.file(profileImage!),
                               
                        ),
                      ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          shadowColor: Colors.grey.shade600,
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 70,
                          height: 70,
                          child: profileImage==null ? Image.network(
                                  "https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg"):Image.file(profileImage!),
                              
                        ),
                      ),
                    ),

                    Text( profileName == "" ?"username":profileName ,
                         style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    GestureDetector(
                      onTap: () {
                        // Navigator.popAndPushNamed(context, '/profile');
                        _onItemTapped(3);
                        // Navigator.pop(context);
                      }, 
                        child: Text("View profile",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600))),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.blue.shade200),
              ),
              ListTile(
                title: Text("Favorited Place"),
                onTap: () => _onItemTapped(2),
              ),
              ListTile(
                title: Text("Listed Place"),
                onTap: () => _onItemTapped(0),
              ),
              ListTile(
                title: Text("My Trip"),
                onTap: () => _onItemTapped(1),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
              ),
              label: "My Trip",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
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
      return FavoritePage();
    case 3:
      return const ProfilePage();
    default:
      return const HomePage();
  }
}
