part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


abstract class ProfileActionState extends ProfileState{}

//build initial

class ProfilePageLoadSuccessState extends ProfileState{
  final List<PlacesDataModel> placeList;
  final List<PlacesDataModel> favList;
  final List<PlacesDataModel> tripList;

  ProfilePageLoadSuccessState({required this.placeList, required this.favList, required this.tripList});
}


//profile edit
class ProfilePageEditLoadingState extends ProfileState{}
class ProfilePageEditBoxDisplayState extends ProfileState{}
class profilePageEditedSuccessState extends ProfileActionState{}