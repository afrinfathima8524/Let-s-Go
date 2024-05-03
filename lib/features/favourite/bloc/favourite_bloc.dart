import 'package:bloc/bloc.dart';
import 'package:lets_go/model/Places.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial());
@override
Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    if (event is LoadFavouritesEvent) {
      yield* _mapLoadFavouritesToState();
    } else if (event is RemoveFromFavouritesEvent) {
      yield* _mapRemoveFromFavouritesToState(event.favoriteItem);
    }
  }

  Stream<FavouriteState> _mapLoadFavouritesToState() async* {
    List<PlacesDataModel> favourites = [
      
     
    ];

    yield FavouritesLoadedState(favourites: favourites);
  }

  Stream<FavouriteState> _mapRemoveFromFavouritesToState(PlacesDataModel favoriteItem) async* {

    print('Removed from favorites: ${favoriteItem.name}');

    yield* _mapLoadFavouritesToState();
  }
}
