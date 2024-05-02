import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/model/Places.dart';
class MyListTile extends StatelessWidget {
  final PlacesDataModel place;
  const MyListTile({
    super.key, required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
       // color: Colors.amberAccent,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
       
          children: [
            SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  place.image.toString(),
                  fit: BoxFit.cover,
                )),
                    const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                 Text(
                  place.name.toString(),
                  style:  GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                         ),
                ),
                 Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 14,
                    ),
                    Text(
                      place.location.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating:place.rating as double,
                      itemBuilder: (context, index) =>
                          const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                     Text(
                      "(${place.reviews.toString()})",
                      style:  GoogleFonts.poppins(
                         fontSize:12,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
