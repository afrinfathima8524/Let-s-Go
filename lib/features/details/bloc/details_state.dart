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

  DetailsPageDetailsLoadedSuccessState( {required this.details,required this.list,});
}//loaded success

//place details change
class DetailsPagePlaceDetailsChangedSuccessState extends DetailsState{
  final PlacesDataModel clickedPlaceDetails;
   final List<PlacesDataModel> list;

  DetailsPagePlaceDetailsChangedSuccessState( {required this.clickedPlaceDetails,required this.list,});
}

//navigation State
class DetailsToHomeNavigationState extends DetailsActionState{}