import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lets_go/model/Places.dart';
class MyListTile extends StatelessWidget {
  final PlacesDataModel list;
  const MyListTile({
    super.key, required this.list,
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
                    tag:"img ",
                    child: Image.network(
                      "https://static.toiimg.com/img/107852737/Master.jpg",
                      fit: BoxFit.cover,
                    ))),
                    const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                 Text(
                  list.name.toString(),
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
                      list.location.toString(),
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
                      rating:list.rating as double,
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
                      "(${list.reviews.toString()})",
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
