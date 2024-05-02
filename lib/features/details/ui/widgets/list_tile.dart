import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:lets_go/model/Places.dart';
class MyListTile extends StatelessWidget {
  final PlacesDataModel place;
  const MyListTile({
    super.key, required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SizedBox(
       // color: Colors.amberAccent,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
       
          children: [
            SizedBox(
                width: 80,
                height: 80,
                child: Hero(
                    tag:"hero",
                    child: Image.network(
                      place.image.toString(),
                      fit: BoxFit.cover,
                    ))),
                    const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                 Text(
                  place.name.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                 Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 15,
                    ),
                    Text(
                      place.location.toString(),
                      style: const TextStyle(
                          fontSize: 16,
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
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
