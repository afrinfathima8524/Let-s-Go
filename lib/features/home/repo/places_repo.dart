import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lets_go/model/Places.dart';

class PlacesRepo {
  static Future<List<PlacesDataModel>> fetchPlace({String? query})async{
    var client=http.Client();
    List<PlacesDataModel> places=[];
    try{
      var response= await client.get(Uri.parse('https://mocki.io/v1/3b5e50c9-aae9-48f2-8c50-82f9d33742e3'));
      List result = jsonDecode(response.body);
      for (var i = 0; i < result.length; i++) {
        PlacesDataModel place=PlacesDataModel.fromJson(result[i] as Map<String,dynamic>);
        places.add(place);
        if (query != null) {
          places=places.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList();
        }
      }
      return places;
    }
    catch(e){
      return[]
;    }
  }
}