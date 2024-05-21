part of 'trip_bloc.dart';

@immutable
sealed class TripEvent {}

class TripPageInitialEvent extends TripEvent{}


class TripPageFavoriteRemoveEvent extends TripEvent{
  final PlacesDataModel Triped;

  TripPageFavoriteRemoveEvent({required this.Triped});

}