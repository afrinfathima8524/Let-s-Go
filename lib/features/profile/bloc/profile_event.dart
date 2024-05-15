part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


//initial

class ProfilePageInitialEvent extends ProfileEvent{}

//editbutton
class ProfilePagePictureEditButtonClickedEvent extends ProfileEvent{}//
class ProfilePageEditDetailEvent extends ProfileEvent{}

//editsave event

class ProfilePageEditDetailSavedEvent extends ProfileEvent{
  final String name,location;
  final File? image;

  ProfilePageEditDetailSavedEvent({required this.name, required this.location,this.image,});
}
