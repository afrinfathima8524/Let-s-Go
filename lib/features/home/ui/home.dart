import 'package:firebase_auth/firebase_auth.dart';
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
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  User? currentUser;
  String userName='';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _scaffoldstate.currentState!.openEndDrawer();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        currentUser = user;
        if (user != null) {
          int index=user.email!.indexOf("@");
          userName=user.email!.substring(0,index);
          profileName = userName;
        }
      });
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
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
                setState(() {});
              },
              icon: const Icon(Icons.notes_rounded)),
          actions: [
            _selectedIndex != 3
                ? GestureDetector(
                    onTap: () => _onItemTapped(3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 30,
                          height: 30,
                          child: profileImage == null
                              ? Image.network(
                                  "https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg")
                              : Image.file(profileImage!),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      tooltip: "application Version :v1.0.0",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AboutDialog(
                              applicationName: "Let's Go",
                              applicationVersion: "v1.0.0",
                              applicationIcon: Icon(
                                Icons.travel_explore,
                                color: Colors.blue,
                              ),
                              children: [
                                Text(
                                    "This is our new application named Let'sGo.It was developed by BlueOshan's Mobile Dev Team..."),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Team :"),
                                Text("Afrin"),
                                Text("Vetri"),
                                Text("Mathan"),
                                Text("Siddharth"),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.info,
                        color: Colors.blue,
                      ),
                    ),
                  ),
          ],
        ),
        drawer: Drawer(
          shadowColor: Colors.grey.shade600,
          child: Expanded(
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
                            child: profileImage == null
                                ? Image.network(
                                    "https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg")
                                : Image.file(profileImage!),
                          ),
                        ),
                      ),
                      Text(profileName,
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Navigator.popAndPushNamed(context, '/profile');
                      //     _onItemTapped(3);
                      //     // Navigator.pop(context);
                      //   },
                      //     child: Text("View profile",
                      //         style: GoogleFonts.poppins(
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.grey.shade600))),
                      Text(
                        currentUser?.email ?? "",
                        style: TextStyle(fontSize: 12),
                      ),
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
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: Text("Confirm Logout"),
                          content: Text("are you sure you want to logout?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                signOut();
                              },
                              child: Text(
                                "Log Out",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    title: Text("Log Out"),
                    trailing: Icon(Icons.logout),
                  ),
                ),
              ],
            ),
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
      return const myTripList();
    case 2:
      return FavoritePage();
    case 3:
      return const ProfilePage();
    default:
      return const HomePage();
  }
}
