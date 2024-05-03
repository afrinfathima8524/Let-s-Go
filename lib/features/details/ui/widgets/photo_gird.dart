import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/model/Places.dart';

class PhotosGrid extends StatelessWidget {
  final PlacesDataModel clickedPlace;
  final StreamController streamController;
  const PhotosGrid({super.key, required this.clickedPlace, required this.streamController});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "PHOTOS",
              style:  GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                       ),
            ),
            SizedBox(
              height: constraints.maxWidth < 400
                  ? 250
                  : constraints.maxWidth < 600
                      ? 380
                      : constraints.maxWidth < 900
                          ? 180
                          : 160,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: constraints.maxWidth < 600 ? 3 : 6,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: clickedPlace.photos!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        streamController
                            .add(clickedPlace.photos![index].toString());
                      },
                      child: Image.network(
                        clickedPlace.photos![index].toString(),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
