import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lets_go/features/details/data/details_data.dart';
import 'package:lets_go/features/home/repo/places_repo.dart';
import 'package:lets_go/model/Places.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomePagePLaceClickedEvent>(homePagePLaceClickedEvent);
    on<FilterPlaceEvent>(filterPlaceEvent);
    on<NavigateToFavroitePageEvent>(navigateToFavroitePageEvent);
    on<ClearSearchEvent>(clearSearchEvent);
  }

  FutureOr<void> homeInitialFetchEvent(
      HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    List<PlacesDataModel> places = await PlacesRepo.fetchPlace();
    await Future.delayed(const Duration(seconds: 1));
    emit(PLacesFetchSucessState(places: places, filteredPlace: null));
  }

  FutureOr<void> homePagePLaceClickedEvent(
      HomePagePLaceClickedEvent event, Emitter<HomeState> emit) {
    placeDetail = event.placeClicked;
    emit(PlaceDetailNavigatePageState());
  }

  FutureOr<void> filterPlaceEvent(
      FilterPlaceEvent event, Emitter<HomeState> emit) {
    final filteredPlaces = event.places
        .where((place) =>
            place.name!.toLowerCase().contains(event.filterValue.toLowerCase()))
        .toList();
    emit(PLacesFetchSucessState(
        places: event.places, filteredPlace: filteredPlaces));
  }

  FutureOr<void> navigateToFavroitePageEvent(
      NavigateToFavroitePageEvent event, Emitter<HomeState> emit) {
    emit(NavigateToFavroitePageState());
  }

  FutureOr<void> clearSearchEvent(
      ClearSearchEvent event, Emitter<HomeState> emit) async {
    List<PlacesDataModel> places = await PlacesRepo.fetchPlace();
    emit(PLacesFetchSucessState(places: places, filteredPlace: null));
  }
}
