part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

//initial setup Events

class DetailPageInitialEvent extends DetailsEvent{}


//interacting events
class DetailsPagePlaceDetailsChangeEvent extends DetailsEvent{
  final PlacesDataModel clickedPlace;

  DetailsPagePlaceDetailsChangeEvent({required this.clickedPlace});
}

//favorite 

class DetailPageFavoriteAddEvent extends DetailsEvent{
  final PlacesDataModel favorited;

  DetailPageFavoriteAddEvent({required this.favorited});
  
}


//Mytrip 

class DetailPageMytripAddEvent extends DetailsEvent{
  final PlacesDataModel myTrip;

  DetailPageMytripAddEvent({required this.myTrip});
 
}


//navigations
class DetailsToHomeNavigateEvent extends DetailsEvent{}


