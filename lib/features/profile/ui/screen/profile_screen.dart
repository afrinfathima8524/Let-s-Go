import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/profile/bloc/profile_bloc.dart';
import 'package:lets_go/features/profile/data/profile_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _placeController = TextEditingController();

  final ProfileBloc profileBloc = ProfileBloc();
  File? _image;

  @override
  void initState() {
    profileBloc.add(ProfilePageInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listener: (context, state) {
          if (state is ProfilePageEditedSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 300),
                content: Text(
                  "Profile Saved!",
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProfilePageEditLoadingState:
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );

            case ProfilePageEditBoxDisplayState:

            final stateData = state as ProfilePageEditBoxDisplayState;
              return Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ClipRRect(
                       borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: stateData.image==null ? Image.network("https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg"):Image.file(stateData.image!,fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          profileBloc.add(ProfilePagePictureEditButtonClickedEvent());
                          
                        },
                        child: Text(
                          "Edit Picture",
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(20, 20),
                                    bottomRight: Radius.elliptical(20, 20)),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Enter your Name",
                              focusColor: Colors.blue.shade200,
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.black)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _placeController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(20, 20),
                                      bottomRight: Radius.elliptical(20, 20)),
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Enter current location",
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.black)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                profileBloc.add(ProfilePageInitialEvent());
                              },
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              )),
                          ElevatedButton(
                            onPressed: () {
                              print(_nameController.text);
                              setState(() {
                                profileBloc.add(ProfilePageEditDetailSavedEvent(
                                    
                                    name: _nameController.text,
                                    location: _placeController.text,
                                    image: stateData.image));
                              });
                            },
                            child: Text(
                              "Save",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

            case ProfilePageLoadSuccessState:
              final detailbook = state as ProfilePageLoadSuccessState;

              return SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                       borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: detailbook.user.img==null ? Image.network("https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg"):Image.file(profileImage!,fit: BoxFit.cover,),
                      ),
                    ),
                          Positioned(
                            left: 150,
                            top: 145,
                            child: GestureDetector(
                              onTap: () {
                                profileBloc.add(ProfilePageEditDetailEvent());
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  width: 35,
                                  height: 35,
                                  child: const Center(
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                      Text(detailbook.user.name,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        detailbook.user.place,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("Places Available",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                          "0${detailbook.placeList.length.toString()}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("Total Trips",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                          "0${detailbook.tripList.length.toString()}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("Favorite List",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                          "0${detailbook.favList.length.toString()}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              // borderRadius:const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            ),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: profileItems.length,
                              itemBuilder: (context, index) {
                                final item = profileItems[index];

                                return Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(item.icon),
                                      title: Text(item.itemName,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                      ),
                                    ),
                                    item.itemName != "Version"
                                        ? const Divider(
                                            thickness: 10,
                                            color: Colors.white,
                                          )
                                        : Container(),
                                  ],
                                );
                              },
                            )),
                      )
                    ],
                  ),
                ),
              );

            default:
              return Container();
          }
        },
      ),
    );
  }
}
