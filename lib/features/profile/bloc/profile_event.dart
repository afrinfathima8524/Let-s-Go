part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


//initial

class ProfilePageInitialEvent extends ProfileEvent{}

//editbutton

class ProfilePageEditDetailEvent extends ProfileEvent{}

//editsave event

class ProfilePageEditDetailSavedEvent extends ProfileEvent{}
