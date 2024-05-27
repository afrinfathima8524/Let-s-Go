import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareTile extends StatelessWidget {
  final String imagepath;
  final String text;
  Function()? onTap;
  SquareTile({super.key, required this.imagepath,required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
        decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(16),color: Colors.grey.shade200),
        child:Row(
          children: [
            Image.asset(imagepath,height: 40,),
            SizedBox(width: 10,),
            Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}