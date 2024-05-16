import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lets_go/features/details/data/details_data.dart';
import 'package:lets_go/features/favourite/data/fav_data.dart';
import 'package:lets_go/features/details/service/apiService.dart';
import 'package:lets_go/model/Places.dart';
import 'package:meta/meta.dart';

import '../../home/repo/places_repo.dart';
import '../data/mytrip_data.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailPageInitialEvent>(detailPageInitialEvent);
    on<DetailsToHomeNavigateEvent>(detailsToHomeNavigateEvent);
    on<DetailsPagePlaceDetailsChangeEvent>(detailsPagePlaceDetailsChangeEvent);
    on<DetailPageFavoriteAddEvent>(detailPageFavoriteAddEvent);
    on<DetailPageMytripAddEvent>(detailPageMytripAddEvent);
  }

  FutureOr<void> detailPageInitialEvent(
      DetailPageInitialEvent event, Emitter<DetailsState> emit) async {
    //initial build method

    emit(DetailsPageDetailsLoadingState());

    await Future.delayed(const Duration(milliseconds: 100));

    List<PlacesDataModel> places = await PlacesRepo.fetchPlace();

    emit(DetailsPageDetailsLoadedSuccessState(
      details: placeDetail,
      list: places,
    ));
  }

  FutureOr<void> detailsToHomeNavigateEvent(
      DetailsToHomeNavigateEvent event, Emitter<DetailsState> emit) {
    print(favoritePlaces);
    emit(DetailsToHomeNavigationState());
  }

  FutureOr<void> detailsPagePlaceDetailsChangeEvent(
      DetailsPagePlaceDetailsChangeEvent event,
      Emitter<DetailsState> emit) async {
    placeDetail = event.clickedPlace;

    final apiService = ApiService(); //get response

    List<PlacesDataModel> places = []; //declare list as empty.

    final response = await apiService.fetchData(); // get list from function

    places = response; //store the List of data.

    final index = placeDetail.id as int;

    emit(DetailsPageDetailsLoadedSuccessState(
      details: places[index],
      list: places,
    ));
  }

  FutureOr<void> detailPageFavoriteAddEvent(
      DetailPageFavoriteAddEvent event, Emitter<DetailsState> emit) {
    if (!favoritePlaces.contains(event.favorited)) {
      favoritePlaces.add(event.favorited);
      emit(DetailsPageFavAddedSuccessState());
    } else {
      favoritePlaces.remove(event.favorited);
      emit(DetailsPageFavRemovedSuccessState());
    }
    // print(favoritePlaces);
    emit(PlaceFavroitedActionState());
  }

  FutureOr<void> detailPageMytripAddEvent(
      DetailPageMytripAddEvent event, Emitter<DetailsState> emit) {
    if (!myTripList.contains(event.myTrip)) {
      myTripList.add(event.myTrip);
      emit(DetailsPageTripAddedSuccessState());
    } else {
      myTripList.remove(event.myTrip);
      emit(DetailsPageTripRemovedSuccessState());
    }
    // print(myTripList);
  }
}
