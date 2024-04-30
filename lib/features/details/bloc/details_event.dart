part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

//initial setup Events

class DetailPageInitialEvent extends DetailsEvent{}


//interacting events

class DetailPagePhotosClickedEvent extends DetailsEvent{}
