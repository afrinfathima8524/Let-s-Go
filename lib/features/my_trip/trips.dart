import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/details/bloc/details_bloc.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';
import 'package:lets_go/features/home/ui/home.dart';
import 'package:lets_go/features/my_trip/bloc/trip_bloc.dart';
import 'package:lottie/lottie.dart';

class myTripList extends StatefulWidget {
  const myTripList({super.key});

  @override
  State<myTripList> createState() => _myTripListState();
}

class _myTripListState extends State<myTripList> {
  final TripBloc tripBloc = TripBloc();
  late final DetailsBloc detailsBloc3;

  @override
  void initState() {
    detailsBloc3 = DetailsBloc();
    tripBloc.add(TripPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 3, color: Colors.blue)),
          ),
          child: Text(
            'My Trips',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: BlocConsumer<TripBloc, TripState>(
        bloc: tripBloc,
        listenWhen: (previous, current) => current is TripActionState,
        buildWhen: (previous, current) => current is! TripActionState,
        listener: (context, state) {
          if (state is TripPageFavoriteRemovedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 100),
                content: Text(
                  "The selected place has been deleted!",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 243, 33, 33),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        },
        builder: (BuildContext context, TripState state) {
          switch (state.runtimeType) {
            case TripPageLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case TripPageLoadedState:
              final successState = state as TripPageLoadedState;
              if (successState.TripAdd.isEmpty) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.network(
                        "https://lottie.host/6096c0ad-b67c-4fda-9396-af5f50b4ee43/lS8njlPOD6.json",
                        width: 400,
                        height: 400,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'No Trips Added',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ));
              } else {
                return ListView.builder(
                  itemCount: successState.TripAdd.length,
                  itemBuilder: (context, index) {
                    final TripItem = successState.TripAdd[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  detailsBloc3.add(
                                      DetailsPagePlaceDetailsChangeEvent(
                                          clickedPlace: TripItem));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailsPage()));
                                },
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        TripItem.image.toString(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.delete_outline),
                                        color: Colors.white,
                                        onPressed: () {
                                          tripBloc.add(
                                            TripPageFavoriteRemoveEvent(
                                                Triped: TripItem),
                                          );
                                        },
                                      ),
                                    ],
                                  )),
                              Positioned(
                                bottom: 45,
                                left: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      TripItem.name.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      TripItem.location.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: TripItem.rating as double,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 24.0,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              ;
            case TripPageFavoriteRemovedState:
              return Container();
            default:
              return Center(
                child: Text('Error Something went Wrong'),
              );
          }
        },
      ),
    );
  }
}
