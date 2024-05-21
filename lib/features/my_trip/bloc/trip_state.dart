part of 'trip_bloc.dart';

abstract class TripState {}
abstract class TripActionState extends TripState{}


class TripInitial extends TripState {}

class TripPageLoadingState extends TripState {}

class TripPageLoadedState extends TripState {
  final List<PlacesDataModel> TripAdd;

  TripPageLoadedState({required this.TripAdd});
}

class TripPageFavoriteRemovedState extends TripState {}
