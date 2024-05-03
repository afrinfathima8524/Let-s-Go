import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lets_go/features/favourite/models/favourite_model.dart';

class FavouritesSection extends StatelessWidget {
  final List<Model> favoriteItems;

  const FavouritesSection({Key? key, required this.favoriteItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        final favoriteItem = favoriteItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              favoriteItem.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: favoriteItem.rating ?? 0.0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    Text(
                      "(${favoriteItem.reviews ?? 0})",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  favoriteItem.location ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            onTap: () {
              // Handle tap on favorite item
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Handle delete action
              },
            ),
          ),
        );
      },
    );
  }
}
