// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lets_go/features/details/bloc/details_bloc.dart';
import 'package:lets_go/features/details/ui/widgets/list_tile.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final DetailsBloc detailsBloc = DetailsBloc();

  @override
  void initState() {
   detailsBloc.add(DetailPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<DetailsBloc, DetailsState>(
      bloc: detailsBloc,
      listenWhen: (previous, current) => current is DetailsActionState,
      buildWhen: (previous, current) => current is! DetailsActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case DetailsPageDetailsLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );

          case DetailsPageDetailsLoadErrorState:
            return const Scaffold(body: Center(child: Text("Page Not Found")));

          case DetailsPageDetailsLoadedSuccessState:

       final successState = state as DetailsPageDetailsLoadedSuccessState ;
          final clickedPlace = successState.details;
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            clickedPlace.image.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
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
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
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
                                rating:clickedPlace.rating as double,
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
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                            clickedPlace.description.toString()+clickedPlace.funFact.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "PHOTOS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 250,
                            child: GridView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1 / 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Hero(
                                    tag: "ss",
                                    child: Image.network(
                                      clickedPlace.photos![index].toString(),
                                      fit: BoxFit.cover,
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                              itemCount: 9,
                              itemBuilder: (context, index) {
                                return  MyListTile(list: clickedPlace,);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );

            default:
            return Container();
        }
      },
    );
  }
}
