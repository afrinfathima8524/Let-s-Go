import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lets_go/model/Places.dart';

class PlacesRepo {
  static Future<List<PlacesDataModel>> fetchPlace()async{
    var client=http.Client();
    List<PlacesDataModel> places=[];
    try{
      var response= await client.get(Uri.parse('https://mocki.io/v1/9a09a913-618c-42af-b627-ade7aa5807b2'));
      List result = jsonDecode(response.body);
      for (var i = 0; i < result.length; i++) {
        PlacesDataModel place=PlacesDataModel.fromJson(result[i] as Map<String,dynamic>);
        places.add(place);
      }
      return places;
    }
    catch(e){
      return[]
;    }
  }
}