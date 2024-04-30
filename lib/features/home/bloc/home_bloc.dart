import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lets_go/features/home/repo/places_repo.dart';
import 'package:lets_go/model/Places.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomePagePLaceClickedEvent>(homePagePLaceClickedEvent);
  }

  FutureOr<void> homeInitialFetchEvent(
      HomeInitialFetchEvent event, Emitter<HomeState> emit) async{
        emit(HomeLoadingState());
        List<PlacesDataModel> places = await PlacesRepo.fetchPlace();
        emit(PLacesFetchSucessState(places: places));
      }

  FutureOr<void> homePagePLaceClickedEvent(HomePagePLaceClickedEvent event, Emitter<HomeState> emit) {

    

    emit(PlaceDetailNavigatePageState());


  }


}
