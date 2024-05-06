import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lets_go/features/details/data/details_data.dart';
import 'package:lets_go/features/details/service/apiService.dart';
import 'package:lets_go/model/Places.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailPageInitialEvent>(detailPageInitialEvent);
    on<DetailsToHomeNavigateEvent>(detailsToHomeNavigateEvent);
    on<DetailsPagePlaceDetailsChangeEvent>(detailsPagePlaceDetailsChangeEvent);
 
  } 
  FutureOr<void> detailPageInitialEvent(DetailPageInitialEvent event, Emitter<DetailsState> emit) async {        
    emit(DetailsPageDetailsLoadingState());
    await Future.delayed(const Duration(milliseconds: 100));
    final apiService = ApiService();   
    List<PlacesDataModel> places = [] ;  
 final response = await apiService.fetchData();
     places = response; 
    // print(places[0].name);
    final index = placeDetail.id as int;
   emit(DetailsPageDetailsLoadedSuccessState(details:places[index - 1],list: places));

  }
  FutureOr<void> detailsToHomeNavigateEvent(DetailsToHomeNavigateEvent event, Emitter<DetailsState> emit) {
    emit(DetailsToHomeNavigationState());
  }
  FutureOr<void> detailsPagePlaceDetailsChangeEvent(DetailsPagePlaceDetailsChangeEvent event, Emitter<DetailsState> emit) async {
    placeDetail = event.clickedPlace;
    final apiService = ApiService();   

    List<PlacesDataModel> places = [] ; 
 final response = await apiService.fetchData();
     places = response; 
    emit(DetailsPagePlaceDetailsChangedSuccessState(clickedPlaceDetails: placeDetail,list:places));
  }
}
