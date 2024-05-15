import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/home/bloc/home_bloc.dart';
import 'package:lets_go/model/Places.dart';

class PlaceTile extends StatefulWidget {
  final PlacesDataModel placesDataModels;
  final HomeBloc homeBloc;
  const PlaceTile(
      {super.key, required this.placesDataModels, required this.homeBloc});

  @override
  State<PlaceTile> createState() => _PlaceTileState();
}

class _PlaceTileState extends State<PlaceTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16/10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.placesDataModels.image.toString(),
                fit: BoxFit.cover,
                height: 110,
              ),
            ),
          ),
          Text(widget.placesDataModels.name.toString(),style: GoogleFonts.poppins(fontSize:15,fontWeight:FontWeight.w500),),
          Text(widget.placesDataModels.location.toString(),style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:Colors.grey),),
        ],
      ),
    );
  }
}
