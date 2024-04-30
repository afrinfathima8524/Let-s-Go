import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:lets_go/features/details/models/places_data_model.dart';
import 'package:lets_go/features/details/service/apiService.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailPageInitialEvent>(detailPageInitialEvent);
  }
  
  
  FutureOr<void> detailPageInitialEvent(DetailPageInitialEvent event, Emitter<DetailsState> emit) async {        //initial build method
    
    emit(DetailsPageDetailsLoadingState());

    await Future.delayed(const Duration(seconds: 3));

    final _apiService = ApiService();   //get response

    List<PlacesDataModel> places = [] ;  //declare list as empty.


 final response = await _apiService.fetchData();// get list from function

     places = response; //store the List of data.

    // print(places[0].name);

   emit(DetailsPageDetailsLoadedSuccessState(list: places));

  }
}
