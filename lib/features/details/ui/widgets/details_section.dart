import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/model/Places.dart';

class DetailSection extends StatefulWidget {
  final PlacesDataModel clickedPlace;
  const DetailSection({Key? key, required this.clickedPlace}) : super(key: key);

  @override
  _DetailSectionState createState() => _DetailSectionState();
}

class _DetailSectionState extends State<DetailSection> {
  bool isFavorite = false;

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
              widget.clickedPlace.location.toString(),
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.clickedPlace.name.toString(),
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite; 
                });
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.blue : null,
                size: 25,
              ),
            ),
          ],
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: widget.clickedPlace.rating as double,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
            Text(
              "(${widget.clickedPlace.reviews.toString()})",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.clickedPlace.description.toString() + widget.clickedPlace.funFact.toString(),
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
