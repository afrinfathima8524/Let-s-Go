import 'package:flutter/material.dart';


class Item{
 final String itemName;
 final IconData icon;

  Item({required this.itemName, required this.icon});
}


List<Item> profileItems = [
  Item(itemName: "Profile", icon:Icons.person),
  Item(itemName: "Bookmarked", icon: Icons.bookmark_border),
  Item(itemName: "Previous Trips", icon: Icons.travel_explore),
  Item(itemName: "Settings", icon: Icons.settings),
  Item(itemName: "Version", icon: Icons.view_in_ar)
];