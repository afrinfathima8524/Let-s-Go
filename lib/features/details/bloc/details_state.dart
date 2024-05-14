part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

abstract class DetailsActionState extends DetailsState{} //actionState

//initial page build states

class DetailsPageDetailsLoadingState extends DetailsState{} //loading    
class DetailsPageDetailsLoadErrorState extends DetailsState{}//error
class DetailsPageDetailsLoadedSuccessState extends DetailsState{
  final PlacesDataModel details;
  final List<PlacesDataModel> list;

  DetailsPageDetailsLoadedSuccessState( {required this.details,required this.list});
}//loaded success

//navigation State
class DetailsToHomeNavigationState extends DetailsActionState{}

//favorite snackbarstate

class DetailsPageFavAddedSuccessState extends DetailsActionState{}
class DetailsPageFavRemovedSuccessState extends DetailsActionState{}
class PlaceFavroitedActionState extends DetailsActionState{}


//mytrip snackbarstate

class DetailsPageTripAddedSuccessState extends DetailsActionState{}
class DetailsPageTripRemovedSuccessState extends DetailsActionState{}