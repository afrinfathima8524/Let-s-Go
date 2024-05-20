import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/details/ui/screens/details_page.dart';
import 'package:lets_go/features/home/ui/home.dart';
import 'package:lets_go/features/my_trip/bloc/trip_bloc.dart';

class myTripList extends StatefulWidget {
  const myTripList({super.key});

  @override
  State<myTripList> createState() => _myTripListState();
}

class _myTripListState extends State<myTripList> {
  final TripBloc tripBloc = TripBloc();
  @override
  void initState() {
    tripBloc.add(TripPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          title: Text('Trip Page'),
          centerTitle: true,
        ),
        body: BlocConsumer<TripBloc, TripState>(
          bloc: tripBloc,
          listenWhen: (previous, current) => current is TripActionState,
          buildWhen: (previous, current) => current is! TripActionState,
          listener: (context, state) {
            if (state is TripPageFavoriteRemovedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(milliseconds: 100),
                  content: Text(
                    "The selected place has been deleted!",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 243, 33, 33),
                      fontWeight: FontWeight.bold,
                    ),
                  )));
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(),
                                    ),
                                  );
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
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    TripItem.name.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete_outline),
                                    color: Colors.black,
                                    onPressed: () {
                                      tripBloc.add(
                                        TripPageFavoriteRemoveEvent(
                                            Triped: TripItem),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              case TripPageFavoriteRemovedState:
                return Container();
              default:
                return Center(
                  child: Text('Error Something went Wrong'),
                );
            }
          },
        ),
      ),
    );
  }
}
// myTripList

// ListTile(
//                       title: Text(TripItem.name ?? ''),
//                       subtitle: Text(TripItem.location ?? ''),
//                       leading: Image.network(
//                         TripItem.image ?? '',
//                         width: 100,
//                         height: 80,
//                         fit: BoxFit.cover,
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailsPage(),
//                             ),
//                             );
//                       },
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete_outline_outlined),
//                         onPressed: () {
//                           tripBloc.add(
//                               TripPageFavoriteRemoveEvent(Triped: TripItem));
//                         },
//                       ),
//                     );
