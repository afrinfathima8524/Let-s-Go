part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class LoadFavouritesEvent extends FavouriteEvent {}

class RemoveFromFavouritesEvent extends FavouriteEvent {
  final PlacesDataModel favoriteItem;

  RemoveFromFavouritesEvent(this.favoriteItem);
}
