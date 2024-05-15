import 'dart:io';

import 'package:equatable/equatable.dart';

class User extends Equatable{

 final String name,place;
 final File? img;

  User({required this.name, required this.place,  this.img});
  @override
  List<dynamic> get props => [name,place,img];
}