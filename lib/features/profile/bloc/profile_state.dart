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

  final User user;

  ProfilePageLoadSuccessState({required this.placeList, required this.favList, required this.tripList, required this.user});
}


//profile edit
class ProfilePageEditLoadingState extends ProfileState{}
class ProfilePageEditBoxDisplayState extends ProfileState{
  final File? image;

  ProfilePageEditBoxDisplayState({this.image});
}
class ProfilePageEditedSuccessState extends ProfileActionState{}


//show profile alert
class ProfilePageShowAlertBoxEventState extends ProfileActionState{}
