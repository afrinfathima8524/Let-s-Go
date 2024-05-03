import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/details/bloc/details_bloc.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';
import 'package:lets_go/features/details/ui/widgets/list_tile.dart';
import 'package:lets_go/model/Places.dart';

class PlaceList extends StatelessWidget {
  final List<PlacesDataModel> list;
  final DetailsBloc detailsBloc;
  final StreamController streamController;
  const PlaceList(
      {super.key,
      required this.list,
      required this.detailsBloc,
      required this.streamController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(height: 20,),
        Text(
          "TOUR & TICKETS",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 880,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            physics:const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final place = list[index];
              return GestureDetector(
                onTap: () {
                  detailsBloc.add(
                      DetailsPagePlaceDetailsChangeEvent(clickedPlace: place));

                  streamController.add(place.image);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => DetailsPage(),));

                
                },
                child: MyListTile(
                  place: place,
                ),
              );
            },
          ),
        ),
   
      ],
    );
  }
}
