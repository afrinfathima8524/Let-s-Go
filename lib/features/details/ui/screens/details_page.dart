// ignore_for_file: type_literal_in_constant_pattern

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lets_go/features/details/bloc/details_bloc.dart';
import 'package:lets_go/features/details/ui/widgets/details_section.dart';
import 'package:lets_go/features/details/ui/widgets/hero_image.dart';

import 'package:lets_go/features/details/ui/widgets/place_list.dart';
import 'package:lets_go/model/places.dart';

import '../widgets/photo_gird.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  StreamController<String> streamController = StreamController<String>();

  late Stream<String> multiStream;

  final DetailsBloc detailsBloc = DetailsBloc();

  @override
  void initState() {
    multiStream = streamController.stream.asBroadcastStream(); //broadcast
    detailsBloc.add(DetailPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      bloc: detailsBloc,
      listenWhen: (previous, current) => current is DetailsActionState,
      buildWhen: (previous, current) => current is! DetailsActionState,
      listener: (context, state) {
        if(state is DetailsToHomeNavigationState){
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {

   
   
          case DetailsPageDetailsLoadingState:

          return const Scaffold(
            body: Center(child: 
            CircularProgressIndicator(),),
          );
    

          case DetailsPageDetailsLoadErrorState:
            return const Scaffold(body: Center(child: Text("Page Not Found")));

          case DetailsPageDetailsLoadedSuccessState:
            final successState = state as DetailsPageDetailsLoadedSuccessState;
            final clickedPlace = successState.details;
            return LayoutBuilder(
              builder: (context, constraints) => Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      constraints.maxWidth < 900
                          ? Stack(
                              children: [
                               
                                HeroBanner(
                                  stream: multiStream,
                                  clickedPlace: clickedPlace,
                                ),
                                 Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  child: IconButton(
                                      onPressed: () {detailsBloc.add(DetailsToHomeNavigateEvent());},
                                      icon: const Icon(Icons.arrow_back,color: Colors.white,size: 25,)),
                                ),

                              ],
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: constraints.maxWidth < 900
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DetailSection(clickedPlace: clickedPlace,bloc: detailsBloc,),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  PhotosGrid(
                                    clickedPlace: clickedPlace,
                                    streamController: streamController,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  constraints.maxWidth < 900
                                      ? PlaceList(list: successState.list,detailsBloc: detailsBloc,streamController: streamController,)
                                      : Container(),
                                ],
                              )
                            : Column(
                              children: [
                                SizedBox(
                                  
                                  width: double.infinity,
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(onPressed: (){
                                      detailsBloc.add(DetailsToHomeNavigateEvent());
                                    }, icon: const Icon(Icons.arrow_back,size: 25,))),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //row setup
                                       
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            HeroBanner(
                                              stream: multiStream,
                                              clickedPlace: clickedPlace,
                                            ),
                                            DetailSection(
                                                clickedPlace: clickedPlace,bloc: detailsBloc,),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            PhotosGrid(
                                              clickedPlace: clickedPlace,
                                              streamController: streamController,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child:
                                              PlaceList(list: successState.list,detailsBloc: detailsBloc,streamController: streamController,)),
                                    ],
                                  ),
                              ],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );

            case DetailsPagePlaceDetailsChangedSuccessState:

            final successState = state as DetailsPagePlaceDetailsChangedSuccessState;
            final clickedPlace = successState.clickedPlaceDetails;
            return LayoutBuilder(
              builder: (context, constraints) => Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      constraints.maxWidth < 900
                          ? Stack(
                              children: [
                               
                                HeroBanner(
                                  stream: multiStream,
                                  clickedPlace:clickedPlace,
                                ),
                                 Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  child: IconButton(
                                      onPressed: () {detailsBloc.add(DetailsToHomeNavigateEvent());},
                                      icon: const Icon(Icons.arrow_back,color: Colors.white,size: 25,)),
                                ),
                              ],
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: constraints.maxWidth < 900
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DetailSection(clickedPlace: clickedPlace,bloc: detailsBloc,),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  PhotosGrid(
                                    clickedPlace: clickedPlace,
                                    streamController: streamController,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  constraints.maxWidth < 900
                                      ? PlaceList(list: successState.list,detailsBloc: detailsBloc,streamController: streamController,)
                                      : Container(),
                                ],
                              )
                            : Column(
                              children: [
                                SizedBox(
                                  
                                  width: double.infinity,
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(onPressed: (){
                                      detailsBloc.add(DetailsToHomeNavigateEvent());
                                    }, icon: const Icon(Icons.arrow_back,size: 25,))),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //row setup
                                       
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            HeroBanner(
                                              stream: multiStream,
                                              clickedPlace: clickedPlace,
                                            ),
                                            DetailSection(
                                                clickedPlace: clickedPlace,bloc: detailsBloc,),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            PhotosGrid(
                                              clickedPlace: clickedPlace,
                                              streamController: streamController,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child:
                                              PlaceList(list: successState.list,detailsBloc: detailsBloc,streamController: streamController,)),
                                    ],
                                  ),
                              ],
                            ),
                      ),
                    ],
                  ),
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
