import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/model/Places.dart';

class DetailSection extends StatelessWidget {
  final PlacesDataModel clickedPlace;
  const DetailSection({super.key, required this.clickedPlace});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.grey,
              size: 17,
            ),
            Text(
              clickedPlace.location.toString(),
              style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              clickedPlace.name.toString(),
              style:  GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                             ),
            ),
             IconButton(
            onPressed: () {},
           icon: const Icon(Icons.favorite_border_outlined,color: Colors.black,size: 25,)),
           
             
          ],
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: clickedPlace.rating as double,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
            Text(
              "(${clickedPlace.reviews.toString()})",
              style:  GoogleFonts.poppins(
                         color:Colors.grey,
                          fontSize:12,
                         ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          clickedPlace.description.toString() + clickedPlace.funFact.toString(),
          style: GoogleFonts.poppins(
                          fontSize: 16,
                         
                         ),
        ),
      ],
    );
  }
}
