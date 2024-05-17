import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lets_go/features/my_trip/mytrip_data.dart';
import 'package:lets_go/model/Places.dart';
import 'package:meta/meta.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  TripBloc() : super(TripInitial()) {
    on<TripPageInitialEvent>(tripPageInitialEvent);
    on<TripPageFavoriteRemoveEvent>(tripPageFavoriteRemoveEvent);
  }

  FutureOr<void> tripPageInitialEvent(
      TripPageInitialEvent event, Emitter<TripState> emit) async {
    emit(TripPageLoadingState());

    await Future.delayed(const Duration(milliseconds: 100));
    emit(TripPageLoadedState(TripAdd: myTripList));
  }

  FutureOr<void> tripPageFavoriteRemoveEvent(
      TripPageFavoriteRemoveEvent event, Emitter<TripState> emit) async {
    myTripList.remove(event.Triped);
    emit(TripPageFavoriteRemovedState());
    emit(TripPageLoadedState(TripAdd: myTripList));

    print(myTripList);
  }
}
