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


//navigations
class DetailsToHomeNavigateEvent extends DetailsEvent{}


