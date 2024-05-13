import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lets_go/features/favourite/fav_data.dart';
import 'package:lets_go/model/Places.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoritesPageInitialEvent>(favoritesPageInitialEvent);
    on<FavoritesPageFavoriteRemoveEvent>(favoritesPageFavoriteRemoveEvent);
  }

  FutureOr<void> favoritesPageInitialEvent(
      FavoritesPageInitialEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesPageLoadingState());

    await Future.delayed(const Duration(milliseconds: 100));
    emit(FavoritesPageLoadedSuccessState(favoritePlaces: favoritePlaces));
  }

  FutureOr<void> favoritesPageFavoriteRemoveEvent(
      FavoritesPageFavoriteRemoveEvent event, Emitter<FavoritesState> emit) {
     
      favoritePlaces.remove(event.favorited);
      emit(FavoritesPageFavoriteRemovedState());
      emit(FavoritesPageLoadedSuccessState(favoritePlaces: favoritePlaces));
    
    print(favoritePlaces);
  }
}
