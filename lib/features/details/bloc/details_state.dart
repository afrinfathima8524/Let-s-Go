part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

abstract class DetailsActionState extends DetailsState{} //actionState

//initial page build states

class DetailsPageDetailsLoadingState extends DetailsState{} //loading    
class DetailsPageDetailsLoadErrorState extends DetailsState{}//error
class DetailsPageDetailsLoadedSuccessState extends DetailsState{
  final List<PlacesDataModel> list;

  DetailsPageDetailsLoadedSuccessState({required this.list});
}//loaded success
