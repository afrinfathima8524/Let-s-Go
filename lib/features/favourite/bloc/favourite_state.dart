part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouritesLoadingState extends FavouriteState {}

class FavouritesLoadedState extends FavouriteState {
  final List<PlacesDataModel> favourites;

  FavouritesLoadedState({required this.favourites});
}

class FavouritesLoadErrorState extends FavouriteState {
  final String errorMessage;

  FavouritesLoadErrorState({required this.errorMessage});
}
