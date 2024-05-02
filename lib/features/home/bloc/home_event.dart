part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class HomeInitialFetchEvent extends HomeEvent{}
class HomePagePLaceClickedEvent extends HomeEvent{
  final PlacesDataModel placeClicked;
  HomePagePLaceClickedEvent({required this.placeClicked});
}
class FilterPlaceEvent extends HomeEvent{
  final List<PlacesDataModel> places;
  final String filterValue;

  FilterPlaceEvent({required this.places, required this.filterValue});
}
