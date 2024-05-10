part of 'favourite_bloc.dart';
abstract class FavoritesState {}
abstract class FavoriteActionState extends FavoritesState{}

class FavoritesInitial extends FavoritesState {}

class FavoritesPageLoadingState extends FavoritesState {}

class FavoritesPageLoadedSuccessState extends FavoritesState {
  final List<PlacesDataModel> favoritePlaces;

  FavoritesPageLoadedSuccessState({required this.favoritePlaces});
}

class FavoritesPageFavoriteRemovedState extends FavoriteActionState {}
