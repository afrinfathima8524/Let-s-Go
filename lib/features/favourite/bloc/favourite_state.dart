part of 'favourite_bloc.dart';


abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesPageLoadingState extends FavoritesState {}

class FavoritesPageLoadedSuccessState extends FavoritesState {
  final List<PlacesDataModel> favoritePlaces;

  FavoritesPageLoadedSuccessState(this.favoritePlaces);
}

class FavoritesPageFavoriteRemovedState extends FavoritesState {}
