import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lets_go/features/details/data/mytrip_data.dart';
import 'package:lets_go/features/favourite/fav_data.dart';


import 'package:lets_go/model/Places.dart';
import 'package:lets_go/model/usermodel.dart';
import 'package:meta/meta.dart';

import '../../details/service/apiService.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfilePageInitialEvent>(profilePageInitialEvent);
    on<ProfilePageEditDetailEvent>(profilePageEditDetailEvent);
    on<ProfilePageEditDetailSavedEvent>(profilePageEditDetailSavedEvent);
  }
  
  FutureOr<void> profilePageInitialEvent(ProfilePageInitialEvent event, Emitter<ProfileState> emit) async {

     final apiService = ApiService();   //get response

    List<PlacesDataModel> places = [] ;  //declare list as empty.


 final response = await apiService.fetchData();// get list from function

     places = response; 
   
    User user = User(name:"name", place: "chennai");
 
   emit(ProfilePageLoadSuccessState(favList: favoritePlaces,placeList:places,tripList: myTripList,user: user));
    
  }

  FutureOr<void> profilePageEditDetailEvent(ProfilePageEditDetailEvent event, Emitter<ProfileState> emit) async {

    emit(ProfilePageEditLoadingState());

    await Future.delayed(Duration(seconds: 1));

    emit(ProfilePageEditBoxDisplayState());



  }

  FutureOr<void> profilePageEditDetailSavedEvent(ProfilePageEditDetailSavedEvent event, Emitter<ProfileState> emit) async{

      final apiService = ApiService();   //get response

    List<PlacesDataModel> places = [] ;  //declare list as empty.


 final response = await apiService.fetchData();// get list from function

     places = response; 

   
   
    User user = User(name:event.name, place: event.location); //edited user details
  

   emit(ProfilePageEditLoadingState());

   emit(ProfilePageEditedSuccessState());

  emit(ProfilePageLoadSuccessState(favList: favoritePlaces,placeList:places,tripList: myTripList,user: user));
      

   
  }
}

