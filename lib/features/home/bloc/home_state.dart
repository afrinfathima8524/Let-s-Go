part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
sealed class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class PLacesFetchSucessState extends HomeState {
  final List<PlacesDataModel> places;
  final List<PlacesDataModel>? filteredPlace;
  PLacesFetchSucessState({
    required this.places,
    this.filteredPlace,
  });
}

class NavigateToFavroitePageState extends HomeActionState{}
class PlaceDetailNavigatePageState extends HomeActionState{}

