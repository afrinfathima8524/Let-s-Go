import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lets_go/model/Places.dart';

class HeroBanner extends StatelessWidget {
  final Stream<String> stream;
  final PlacesDataModel clickedPlace;
  const HeroBanner(
      {super.key, required this.stream, required this.clickedPlace});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => StreamBuilder<String>(
          stream: stream,
            builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: constraints.maxWidth < 600
                    ? 250
                    : constraints.maxWidth < 900
                        ? 350
                        : 450,
                width: double.infinity,
                child: Hero(
                    tag: "banner",
                    child: Image.network(
                      snapshot.data.toString(),
                      fit: BoxFit.cover,
                    )),
              );
            } else {
               return Container(
                height: constraints.maxWidth < 600
                    ? 250
                    : constraints.maxWidth < 900
                        ? 350
                        : 450,
                width: double.infinity,
                child: Hero(
                    tag: "hero",
                    child: Image.network(
                      clickedPlace.image.toString(),
                      fit: BoxFit.cover,
                    )),
              );
            }
          }),
    );
  }
}
