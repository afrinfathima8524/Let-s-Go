import 'dart:io';

import 'package:flutter/material.dart';


class Item{
 final String itemName,para;
 final IconData icon;
 final String pic;


  Item({required this.itemName, required this.icon,required this.para,required this.pic,});
}


List<Item> profileItems = [
  Item(itemName: "Profile", icon:Icons.person,para: "This refers to the details of the individual such the name location among others and acts as an address of the identity of the individual",pic: "https://lottie.host/35e0c5e6-b23c-4b33-b8ac-d81f3d3a2864/DkslGTFdsh.json"),
  Item(itemName: "Bookmarked", icon: Icons.bookmark_border,para: "It refers to the details of the places bookmarked by the individual and the reference to them might be an indicator that it could be used in the future",pic: "https://lottie.host/ec4c5f78-13be-480a-8de9-47d94852ca1b/kr88hkTXJd.json"),
  Item(itemName: "Previous Trips", icon: Icons.travel_explore,para: "It refers to the list of previous trips undertaken by the individual using this application and is shown to him.",pic: "https://lottie.host/d9bf76b5-6455-4b4c-97ab-c8d6c82de431/swvuvrBWVo.json"),
  Item(itemName: "Settings", icon: Icons.settings,para: "It is a tool that gives an opportunity for the user change certain features and make it more palatable to him",pic: "https://lottie.host/b7602d6e-163b-40a7-be73-4318a35e09e8/IFXQa8pyq5.json"),
  Item(itemName: "Version", icon: Icons.view_in_ar,para: " It gives the status of the current version the application is functioning with. It helps the individual to make certain updates in the future if necessary.",pic: "https://lottie.host/73088099-351c-4147-9b59-e84be9420f98/T8U5m6mULv.json")
];

//profile pic
File? profileImage = null ;

String profileName = "";
String profileEmail = "";
String profilePassword = "";
String profilePlace ="Edit profile Now!";