import 'package:flutter/material.dart';
import 'package:lets_go/features/details/ui/widgets/list_tile.dart';
import 'package:lets_go/model/Places.dart';

class PlaceList extends StatelessWidget {
  final List<PlacesDataModel> list;
  const PlaceList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      // const SizedBox(height: 20,),
        const Text(
          "TOUR & TICKETS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 780,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final place = list[index];
              return MyListTile(
                place: place,
              );
            },
          ),
        ),
      ],
    );
  }
}
