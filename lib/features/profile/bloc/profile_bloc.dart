import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lets_go/features/favourite/data/fav_data.dart';

import 'package:lets_go/model/Places.dart';
import 'package:lets_go/model/usermodel.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../details/service/apiService.dart';
import '../../my_trip/mytrip_data.dart';
import '../data/profile_list.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfilePageInitialEvent>(profilePageInitialEvent);
    on<ProfilePageEditDetailEvent>(profilePageEditDetailEvent);
    on<ProfilePageEditDetailSavedEvent>(profilePageEditDetailSavedEvent);
    on<ProfilePagePictureEditButtonClickedEvent>(
        profilePagePictureEditButtonClickedEvent);
        on<ProfilePageShowDetailsEvent>(profilePageShowDetailsEvent);
  }

  FutureOr<void> profilePageInitialEvent(
      ProfilePageInitialEvent event, Emitter<ProfileState> emit) async {
    final apiService = ApiService(); //get response
    List<PlacesDataModel> places = []; //declare list as empty.
    final response = await apiService.fetchData(); // get list from function
    places = response;
    User user = User(name: profileName, place: profilePlace, img: profileImage);
    emit(ProfilePageLoadSuccessState(
        favList: favoritePlaces,
        placeList: places,
        tripList: myTripList,
        user: user));
    print("propic:${profileImage}");
  }

  FutureOr<void> profilePageEditDetailEvent(
      ProfilePageEditDetailEvent event, Emitter<ProfileState> emit) async {
    emit(ProfilePageEditLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(ProfilePageEditBoxDisplayState());
  }

  FutureOr<void> profilePageEditDetailSavedEvent(
      ProfilePageEditDetailSavedEvent event, Emitter<ProfileState> emit) async {
    final apiService = ApiService(); //get response
    List<PlacesDataModel> places = []; //declare list as empty.
    final response = await apiService.fetchData(); // get list from function
    places = response;
    //store the details
    profileName = event.name;
    profilePlace = event.location;
    User user = User(
        name: event.name,
        place: event.location,
        img: event.image); //edited user details
    emit(ProfilePageEditLoadingState());
    emit(ProfilePageEditedSuccessState());
    emit(ProfilePageLoadSuccessState(
        favList: favoritePlaces,
        placeList: places,
        tripList: myTripList,
        user: user));
  }

  FutureOr<void> profilePagePictureEditButtonClickedEvent(
      ProfilePagePictureEditButtonClickedEvent event,
      Emitter<ProfileState> emit) async {
    File? _image;
//save image
    Future<File> saveFilePermanently(String imagePath) async {
      final directory = await getApplicationDocumentsDirectory();
      final name = basename(imagePath);
      final image = File('${directory.path}/$name');
      return File(imagePath).copy(image.path);
    }

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    //final imgTemp = File(image.path);
    final imagePermanent = await saveFilePermanently(image.path);
    _image = imagePermanent;
    //print("img: $_image");
    profileImage = _image;
    emit(ProfilePageEditBoxDisplayState(image: profileImage));
  }

  FutureOr<void> profilePageShowDetailsEvent(ProfilePageShowDetailsEvent event, Emitter<ProfileState> emit) async{

    final apiService = ApiService(); //get response
    List<PlacesDataModel> places = []; //declare list as empty.
    final response = await apiService.fetchData(); // get list from function
    places = response;

    

  

  //  print(index);

    emit(ProfilePageShowAlertBoxEventState());
 User user = User(name: profileName, place: profilePlace, img: profileImage);
    emit(ProfilePageLoadSuccessState(
        favList: favoritePlaces,
        placeList: places,
        tripList: myTripList,
        user: user));
  
   
   
  }
}
