part of 'favourite_bloc.dart';
abstract class FavoritesEvent {}

class FavoritesPageInitialEvent extends FavoritesEvent {}

class FavoritesPageFavoriteRemoveEvent extends FavoritesEvent {
  final PlacesDataModel favorited;

  FavoritesPageFavoriteRemoveEvent(this.favorited);
}
