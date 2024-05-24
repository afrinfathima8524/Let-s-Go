import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareTile extends StatelessWidget {
  final String imagepath;
  Function()? onTap;
  SquareTile({super.key, required this.imagepath,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(16),color: Colors.grey.shade200),
        child:Image.asset(imagepath,height: 40,),
      ),
    );
  }
}