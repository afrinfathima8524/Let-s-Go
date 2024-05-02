import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        Text(
          clickedPlace.name.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          clickedPlace.description.toString() + clickedPlace.funFact.toString(),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
