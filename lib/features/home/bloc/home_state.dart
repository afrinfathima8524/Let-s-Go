part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
sealed class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class PLacesFetchSucessState extends HomeState{
  final List<PlacesDataModel> places;
  PLacesFetchSucessState({required this.places});
}
class PlaceDetailNavigatePageState extends HomeActionState{}
